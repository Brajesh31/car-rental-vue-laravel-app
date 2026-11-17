# 🛡️ Security Release Checklist

- [ ] CSRF middleware is enabled for state-changing browser routes.
- [ ] Registration cannot set privileged roles.
- [ ] Every rental read/update/cancel operation checks ownership or admin policy.
- [ ] Dashboard props contain only authorized, necessary fields.
- [ ] Booking totals are calculated server-side.
- [ ] Booking conflict checks are transaction-safe.
- [ ] Login, registration and sensitive actions are rate-limited.
- [ ] Password reset and session behavior are reviewed.
- [ ] Uploads validate MIME, size and storage destination.
- [ ] Production debug mode is disabled.
- [ ] Secrets are stored outside source control.
- [ ] Database exports contain synthetic data only.
- [ ] Dependencies and CI alerts are reviewed.
- [ ] Logs exclude secrets and unnecessary personal data.
- [ ] Backup restore procedure has been tested.
- [ ] Security contact and incident process are current.

Record evidence and owner for every unchecked item. Do not treat this checklist as a substitute for a security assessment.
