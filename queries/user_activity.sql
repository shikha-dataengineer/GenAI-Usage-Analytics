SELECT
  user_id,
  ML.GENERATE_TEXT(
    MODEL 'gemini-1.5-flash',
    STRUCT(
      CONCAT(
        "Summarize this user's GenAI activity in one paragraph: ",
        STRING_AGG(
          CONCAT("tokens=", CAST(total_tokens AS STRING), " status=", status),
          ' | '
        )
      ) AS prompt
    )
  ).predicted_text AS user_summary
FROM `gen-ai-analytics-467911.genai_usage.logs`
GROUP BY user_id;
