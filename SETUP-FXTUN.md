# fxtun setup (fixed dev URL)

One-time setup so you don’t need to generate a new tunnel link each day.

## 1. Install fxtun

```bash
curl -fsSL https://fxtun.dev/install.sh | sh
```

## 2. Log in

In the [fxtun dashboard](https://fxtun.dev) create an API token, then:

```bash
fxtun login --token sk_xxxx
```

## 3. Add the loader in Webflow

- Open **Site settings → Custom code → Footer** (or Head).
- Paste the contents of **webflow-loader-snippet.html** into one code block.
- That script loads `main.js` from `https://astralis.fxtun.dev` when the tunnel is up, otherwise from jsDelivr (GitHub).

## 4. When you start working

1. Start your local server so `main.js` is served (e.g. Live Server on port 5500).
2. Start the tunnel:

   ```bash
   ./start-tunnel.sh
   ```
   Or: `fxtun http 5500 --domain astralis`

Your Webflow site will load the script from the tunnel (live edits). When you stop the tunnel or close the laptop, it falls back to the latest version on GitHub via jsDelivr.

## Optional: different subdomain

If `astralis` is taken, use another name and keep it consistent:

```bash
fxtun http 5500 --domain astralis-dev
```

Then in **webflow-loader-snippet.html** set `DEV_URL` to `https://astralis-dev.fxtun.dev/main.js`.
