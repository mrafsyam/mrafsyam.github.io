# Raf's personal website (Flutter web)

A single-page personal site built with Flutter web.

## Edit the content

Everything shown on the site lives in **`lib/data/profile.dart`**: name, intro,
about, skills, experience, projects and contact links. Values in `[brackets]`
or marked `TODO(raf)` are placeholders for details that weren't public. Fill
them in or delete them.

Colours are the constants at the top of `lib/main.dart` (`_accent` is the
orange).

## Run locally

```bash
cd site
flutter pub get
flutter run -d chrome
```

## Build

```bash
flutter build web --release --no-web-resources-cdn
# output: site/build/web
```

## Deploy

`.github/workflows/pages.yml` builds this Flutter site and the Jekyll blog
together on every push to `master` and publishes them to GitHub Pages:

- Flutter site: https://mrafsyam.github.io/
- Blog: https://mrafsyam.github.io/blog/

Old blog URLs (for example `/2017/01/08/...`) are sent to `/blog/...` by the
root `404.html` that the workflow writes.
