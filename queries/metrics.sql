SELECT
  COUNT(*) AS total_logs,
  COUNT(DISTINCT user_id) AS unique_users,
  SUM(total_tokens) AS total_tokens_used,
  AVG(latency_ms) AS avg_latency_ms,
  COUNTIF(status='SUCCESS') AS success_count,
  COUNTIF(status='ERROR') AS error_count
FROM `gen-ai-analytics-467911.genai_usage.logs`;
