package vn.edu.hcmuaf.fit.doanweb.DAO.DB;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.SqlLogger;
import org.jdbi.v3.core.statement.StatementContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.concurrent.TimeUnit;

public class JDBIConnect {
    private static final Logger logger = LoggerFactory.getLogger(JDBIConnect.class);
    private static final String URL = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();
    private static Jdbi jdbi;
    private static HikariDataSource dataSource;

    public static Jdbi get() {
        if (jdbi == null) {
            makeConnect();
        }
        return jdbi;
    }

    private static void makeConnect() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(URL);
        config.setUsername(DBProperties.user());
        config.setPassword(DBProperties.password());
        
        // Connection pool settings - optimized for web applications
        config.setMaximumPoolSize(20); // Increased for better concurrency
        config.setMinimumIdle(10);     // Increased to maintain more connections
        config.setIdleTimeout(TimeUnit.MINUTES.toMillis(10)); // 10 minutes
        config.setConnectionTimeout(TimeUnit.SECONDS.toMillis(30)); // 30 seconds
        config.setMaxLifetime(TimeUnit.HOURS.toMillis(1)); // 1 hour
        config.setValidationTimeout(TimeUnit.SECONDS.toMillis(5)); // 5 seconds
        
        // Performance settings
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        config.addDataSourceProperty("useServerPrepStmts", "true");
        config.addDataSourceProperty("useLocalSessionState", "true");
        config.addDataSourceProperty("rewriteBatchedStatements", "true");
        config.addDataSourceProperty("cacheResultSetMetadata", "true");
        config.addDataSourceProperty("cacheServerConfiguration", "true");
        config.addDataSourceProperty("elideSetAutoCommits", "true");
        config.addDataSourceProperty("maintainTimeStats", "false");
        
        // Connection test settings
        config.setConnectionTestQuery("SELECT 1");
        config.setAutoCommit(true);
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        
        try {
            dataSource = new HikariDataSource(config);
            
            // Create JDBI with SQL logging for development
            jdbi = Jdbi.create(dataSource)
                    .setSqlLogger(new SqlLogger() {
                        @Override
                        public void logBeforeExecution(StatementContext context) {
                            if (logger.isDebugEnabled()) {
                                logger.debug("Executing SQL: {}", context.getRenderedSql());
                            }
                        }

                        @Override
                        public void logAfterExecution(StatementContext context) {
                            if (logger.isDebugEnabled()) {
                                logger.debug("SQL execution completed in {} ms", context.getElapsedTime(ChronoUnit.DAYS));
                            }
                        }

                        @Override
                        public void logException(StatementContext context, SQLException ex) {
                            logger.error("SQL error: {}", ex.getMessage(), ex);
                        }
                    });
            
            logger.info("Database connection pool initialized successfully");
        } catch (Exception e) {
            logger.error("Failed to initialize database connection", e);
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }

    public static void close() {
        if (dataSource != null) {
            logger.info("Closing database connection pool");
            dataSource.close();
            dataSource = null;
            jdbi = null;
        }
    }
}
