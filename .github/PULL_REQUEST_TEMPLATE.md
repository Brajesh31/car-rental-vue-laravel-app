## 🎯 Summary

Describe the user problem and the change.

## 🔗 Related issue
Closes #

## 🧱 Change type
- [ ] Bug fix
- [ ] Feature
- [ ] Security remediation
- [ ] Frontend / Inertia / Vue
- [ ] Route / controller
- [ ] Database / migration
- [ ] Mail / scheduler
- [ ] Documentation
- [ ] CI / tooling

## 🧪 Verification
- [ ] `composer test`
- [ ] `npm run build`
- [ ] `./vendor/bin/pint --test`
- [ ] Role and ownership negative tests
- [ ] CSRF behavior tested
- [ ] Date conflict and concurrent booking tested
- [ ] Mail/scheduler tests where relevant

Commands run and outcomes:

## 🔐 Security and privacy
- [ ] Signup cannot assign elevated roles.
- [ ] CSRF validation is enabled.
- [ ] Dashboard props are role-scoped.
- [ ] Rental record ownership is checked.
- [ ] Booking total is calculated on server.
- [ ] No secrets, sessions or personal records added.
- [ ] Upload validation and file permissions reviewed.

## 🗄️ Data and migration
- [ ] No schema change.
- [ ] Migration added and reversible.
- [ ] Foreign keys/cascade behavior reviewed.
- [ ] Backup/rollback considerations documented.

## 📚 Documentation
- [ ] API/routes docs updated.
- [ ] Architecture/diagrams updated.
- [ ] README/roadmap/changelog updated where appropriate.

## ✅ Reviewer checklist
- [ ] Scope is focused.
- [ ] Positive and negative tests added.
- [ ] No unsupported feature claims.
- [ ] Known risks recorded.