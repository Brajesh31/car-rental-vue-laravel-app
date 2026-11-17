# 🎨 Frontend Engineering Guide

## Stack
Vue 3, Inertia Vue, Vite and Bootstrap/Tailwind-related dependencies are present. Check actual component usage before adding another UI framework.

## Organization
Keep route-level views in resources/js/Pages and reusable presentation components separate from page orchestration. Keep form and network behavior explicit. Use Inertia navigation for server-driven transitions.

## Trust boundaries
The browser is untrusted. Server responses are authoritative for identity, roles, availability and pricing. Never rely on client-side permissions or totals.

## State and forms
Use local state for transient UI state. Handle validation responses, loading states, empty states and server failures. Avoid duplicating business rules in JavaScript.

## URLs and assets
Avoid hard-coded localhost URLs. Use route helpers, asset helpers or configured URLs. Optimize images, provide alt text and record asset licensing. Do not commit copyrighted images without permission.

## Quality checks
Run npm ci and npm run build. Review browser console/network errors, test responsive layouts and perform keyboard/screen-reader smoke tests.
