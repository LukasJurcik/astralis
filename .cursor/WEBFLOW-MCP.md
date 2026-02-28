# Webflow MCP – Keep it connected

Cursor reads MCP config from **`.cursor/mcp.json`** (this folder), not from the project root.

## Why it keeps disconnecting

1. **Designer + Bridge app** – Designer API tools need the Webflow Designer open **and** the **“Webflow MCP Bridge”** app running (Apps panel, `E` key). If the Designer tab is closed or the app isn’t open, the MCP will disconnect or stop working.

2. **Browser tab sleeping** – If the Designer tab is in the background, the browser may put it to sleep and break the connection.
   - **Chrome:** Pin the Designer tab, or add `webflow.com` to **Always keep these sites active** in `chrome://settings/performance`.
   - **Firefox:** Set `browser.tabs.unloadOnLowMemory` to `false`.

3. **SSE timeouts** – Long idle periods can cause the SSE connection to drop. Reconnect via **Settings → MCP & Integrations** (click Webflow → Connect/Refresh) or restart Cursor.

## Checklist before using Webflow MCP

- [ ] Webflow Designer open with your site
- [ ] Apps panel open (`E`) → “Webflow MCP Bridge” app launched and connected
- [ ] Designer tab pinned or kept active (see above)
- [ ] In Cursor: **Settings → MCP & Integrations** – Webflow shows green/connected

## When Webflow says "Connected" but Cursor shows "Disconnected"

The connection is **Cursor ↔ mcp.webflow.com** (SSE). The Designer + Bridge only affect Designer API tools. If Cursor shows disconnected, try in this order:

1. **Toggle off then on**  
   **Settings → Cursor Settings → MCP & Integrations** → find Webflow → turn the switch **off**, wait a few seconds, turn it **on** again. This often fixes a stuck state.

2. **Logout and Connect again**  
   In the same MCP panel, expand Webflow and click **Logout**. Then click **Connect** and complete the OAuth flow in the browser. (If the browser never opens, it’s a [known Cursor bug](https://forum.cursor.com/t/remote-mcp-server-connect-button-produces-zero-network-requests-oauth-flow-never-starts/150962) — try closing other Cursor windows and retry, or add the server via **+ Add Custom MCP** with the same URL.)

3. **Use one Cursor window**  
   OAuth MCP connections don’t always persist across multiple Cursor windows. Use a single window for this project when using Webflow MCP.

4. **Restart Cursor**  
   Quit Cursor fully and reopen the project, then go to MCP & Integrations and click **Connect** for Webflow if it’s still disconnected.

**Note:** Some users see the red “Disconnected” indicator even when the MCP still works. Try asking the AI to use a Webflow tool (e.g. list sites) — if it works, the issue may be the status indicator only.

## Config location

- **Use:** `.cursor/mcp.json` (project-specific, fewer repeated auth prompts)
- **Not used by Cursor:** `mcp.json` in project root (you can remove or keep as backup)
