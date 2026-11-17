# ✉️ Email and Notifications

## Current integration
The repository includes booking-related mail classes. Confirm the configured mail transport and whether notifications are synchronous or queued in each environment.

## Design requirements
- Send only after the booking transaction commits.
- Use queue workers for non-critical delivery where configured.
- Make retries safe and avoid duplicate side effects.
- Do not include passwords, session links or unnecessary personal data.
- Escape user-controlled values in email templates.
- Use a consistent sender identity and reply-to policy.
- Log message identifiers and delivery failures without logging message secrets.

## Local development
Use the log mailer or a dedicated test mailbox. Never send test messages to real customers.

## Production operations
Monitor queue depth, failed jobs and provider errors. Document credential rotation and delivery outage handling. Verify SPF, DKIM and DMARC with the mail domain owner.

## Tests
Cover successful dispatch, validation failure, transaction rollback, queue retry and notification content privacy.
