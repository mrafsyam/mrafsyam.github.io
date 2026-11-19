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

If the site is served from a sub-path (for example
`https://mrafsyam.github.io/site/`), add `--base-href /site/`.

The `Build Flutter site` GitHub Actions workflow builds the site on every push
and pull request that touches `site/`, and uploads `build/web` as a downloadable
artifact.
