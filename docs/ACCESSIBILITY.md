# ♿ Accessibility Guidelines

Target WCAG 2.2 AA as an engineering goal. This is not a certification claim.

## Interaction
- Every action is keyboard reachable and operable.
- Focus is visible and not hidden by sticky headers or overlays.
- Use buttons for actions and links for navigation.
- Never communicate status through color alone.
- Dialogs manage focus, support Escape when appropriate and return focus to trigger.

## Forms
- Associate every input with a persistent label.
- Explain required fields and accepted formats.
- Associate errors using aria-describedby and mark invalid controls.
- Preserve safe values after validation failure.
- Announce asynchronous status with suitable live regions.

## Content
Use semantic landmarks and heading order. Provide meaningful alt text for informative images and empty alt text for decorative images. Maintain contrast, support zoom/reflow, label table headers and respect reduced-motion preferences.

## Vue/Inertia checklist
Verify focus after navigation and validation. Ensure toast notifications are announced. Test menus and modals without a mouse. Avoid hard-coded dimensions that break narrow viewports.

## Manual test matrix
| Test | Expected result |
|---|---|
| Keyboard-only | All features usable without pointer |
| Screen reader | Titles, landmarks and headings make sense |
| Form errors | Errors announced and associated with fields |
| 200% zoom | Content remains usable |
| Contrast | Text and controls meet applicable contrast |
| Reduced motion | Non-essential motion is reduced |

Record findings using the UI accessibility review template.
