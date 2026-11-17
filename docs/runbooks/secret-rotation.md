# 🔑 Secret and Session Response Runbook

Rotate credentials when a value is committed, logged, shared, or suspected compromised.

## Response sequence
1. Identify affected environments and consumers.
2. Generate new unique secrets and store them in the approved secret manager.
3. Rotate database, mail, cloud storage, and application keys as applicable.
4. Invalidate affected sessions when session data or signing material is exposed.
5. Deploy updated configuration without committing secret values.
6. Verify old credentials no longer authenticate.
7. Review Git history and public artifacts for exposed records.
8. Record completion without recording secret values.

Never place APP_KEY, database passwords, mail credentials, cookies, or tokens in this runbook or a GitHub issue.
