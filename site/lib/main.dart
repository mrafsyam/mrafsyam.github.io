import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data/models.dart';
import 'data/profile.dart';

void main() => runApp(const RafSite());

// Colours. Change these to restyle the whole site.
const _bg = Color(0xFF0E1116);
const _surface = Color(0xFF161B22);
const _border = Color(0xFF262D37);
const _text = Color(0xFFE8EAED);
const _muted = Color(0xFF9AA4B2);
const _accent = Color(0xFFFF7A2F); // basketball orange

class RafSite extends StatelessWidget {
  const RafSite({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark(useMaterial3: true);
    return MaterialApp(
      title: '${profile.name} · ${profile.role}',
      debugShowCheckedModeBanner: false,
      theme: base.copyWith(
        scaffoldBackgroundColor: _bg,
        colorScheme: base.colorScheme.copyWith(primary: _accent, surface: _surface),
        textTheme: base.textTheme.apply(bodyColor: _text, displayColor: _text),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _keys = {
    for (final s in ['About', 'Skills', 'Experience', 'Projects', 'Contact']) s: GlobalKey(),
  };

  void _goTo(String section) {
    final ctx = _keys[section]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 800;
    return Scaffold(
      body: Column(
        children: [
          _NavBar(sections: _keys.keys.toList(), onTap: _goTo, wide: wide),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _Hero(wide: wide, onContact: () => _goTo('Contact')),
                  _Section(key: _keys['About'], title: 'About', child: const _About()),
                  _Section(key: _keys['Skills'], title: 'Skills', child: const _Skills()),
                  _Section(
                      key: _keys['Experience'],
                      title: 'Experience',
                      child: const _Experience()),
                  _Section(
                      key: _keys['Projects'],
                      title: 'Projects',
                      child: _Projects(wide: wide)),
                  const _Section(title: 'Writing', child: _Writing()),
                  _Section(key: _keys['Contact'], title: 'Contact', child: const _Contact()),
                  const _Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- helpers

Future<void> _open(String url) => launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');

class _Constrained extends StatelessWidget {
  const _Constrained({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: child,
          ),
        ),
      );
}

class _Section extends StatelessWidget {
  const _Section({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _Constrained(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(width: 24, height: 3, color: _accent),
              const SizedBox(width: 12),
              Text(title.toUpperCase(),
                  style: const TextStyle(
                      color: _accent,
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: _surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: _border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: _accent.withValues(alpha: 0.06),
        child: Padding(padding: const EdgeInsets.all(22), child: child),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label, {this.small = false});
  final String label;
  final bool small;
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: small ? 10 : 14, vertical: small ? 4 : 8),
        decoration: BoxDecoration(
          color: small ? _accent.withValues(alpha: 0.12) : _surface,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: small ? Colors.transparent : _border),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: small ? 12 : 14,
                color: small ? _accent : _text,
                fontWeight: small ? FontWeight.w600 : FontWeight.w500)),
      );
}

IconData _iconFor(LinkKind k) => switch (k) {
      LinkKind.github => Icons.code_rounded,
      LinkKind.twitter => Icons.alternate_email_rounded,
      LinkKind.telegram => Icons.send_rounded,
      LinkKind.instagram => Icons.photo_camera_outlined,
      LinkKind.blog => Icons.edit_note_rounded,
      LinkKind.linkedin => Icons.work_outline_rounded,
      LinkKind.email => Icons.mail_outline_rounded,
    };

// ---------------------------------------------------------------- sections

class _NavBar extends StatelessWidget {
  const _NavBar({required this.sections, required this.onTap, required this.wide});
  final List<String> sections;
  final ValueChanged<String> onTap;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _bg,
        border: Border(bottom: BorderSide(color: _border)),
      ),
      child: _Constrained(
        child: SizedBox(
          height: 64,
          child: Row(children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: profile.name.toLowerCase(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const TextSpan(
                  text: '.',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800, color: _accent)),
            ])),
            const Spacer(),
            if (wide)
              for (final s in sections)
                TextButton(
                  onPressed: () => onTap(s),
                  style: TextButton.styleFrom(foregroundColor: _muted),
                  child: Text(s),
                )
            else
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu_rounded),
                tooltip: 'Menu',
                onSelected: onTap,
                itemBuilder: (_) =>
                    [for (final s in sections) PopupMenuItem(value: s, child: Text(s))],
              ),
          ]),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.wide, required this.onContact});
  final bool wide;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: wide ? 220 : 120,
      height: wide ? 220 : 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _accent, width: 3),
        boxShadow: [BoxShadow(color: _accent.withValues(alpha: 0.25), blurRadius: 60)],
      ),
      child: ClipOval(
        child: profile.avatarUrl.isEmpty
            ? Container(
                color: _surface,
                alignment: Alignment.center,
                child: Text(profile.name[0],
                    style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w800)))
            : Image.network(profile.avatarUrl, fit: BoxFit.cover),
      ),
    );

    final text = Column(
      crossAxisAlignment: wide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text('Hi, I\'m',
            style: TextStyle(color: _muted, fontSize: wide ? 20 : 16)),
        const SizedBox(height: 4),
        Text(profile.fullName,
            style: TextStyle(
                fontSize: wide ? 64 : 44, fontWeight: FontWeight.w800, height: 1.05)),
        const SizedBox(height: 8),
        Text(profile.role,
            style: TextStyle(
                fontSize: wide ? 26 : 20, color: _accent, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        Text(profile.heroIntro,
            textAlign: wide ? TextAlign.start : TextAlign.center,
            style: const TextStyle(fontSize: 17, color: _muted, height: 1.6)),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.place_outlined, size: 16, color: _muted),
            const SizedBox(width: 6),
            Text(profile.location, style: const TextStyle(color: _muted)),
          ],
        ),
        const SizedBox(height: 28),
        Wrap(spacing: 12, runSpacing: 12, alignment: WrapAlignment.center, children: [
          FilledButton(
            onPressed: onContact,
            style: FilledButton.styleFrom(
                backgroundColor: _accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
            child: const Text('Get in touch', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          OutlinedButton.icon(
            onPressed: () => _open('https://github.com/mrafsyam'),
            icon: const Icon(Icons.code_rounded, size: 18),
            label: const Text('GitHub'),
            style: OutlinedButton.styleFrom(
                foregroundColor: _text,
                side: const BorderSide(color: _border),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
          ),
        ]),
      ],
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.7, -0.2),
          radius: 0.9,
          colors: [Color.alphaBlend(_accent.withValues(alpha: 0.14), _bg), _bg],
        ),
      ),
      child: _Constrained(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: wide ? 96 : 48),
          child: wide
              ? Row(children: [
                  Expanded(child: text),
                  const SizedBox(width: 48),
                  avatar,
                ])
              : Column(children: [avatar, const SizedBox(height: 28), text]),
        ),
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('“${profile.motto}”',
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)),
        const SizedBox(height: 20),
        for (final p in profile.about)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(p, style: const TextStyle(fontSize: 17, height: 1.7, color: _muted)),
          ),
      ],
    );
  }
}

class _Skills extends StatelessWidget {
  const _Skills();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final g in profile.skillGroups)
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: LayoutBuilder(builder: (context, c) {
              final chips = Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [for (final s in g.skills) _Chip(s)],
              );
              final label = Text(g.label,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16));
              return c.maxWidth > 600
                  ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(
                          width: 150,
                          child: Padding(padding: const EdgeInsets.only(top: 8), child: label)),
                      Expanded(child: chips),
                    ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [label, const SizedBox(height: 10), chips]);
            }),
          ),
      ],
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience();
  @override
  Widget build(BuildContext context) {
    Widget entry(Job j, {bool last = false}) => IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Column(children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _bg,
                    border: Border.all(color: _accent, width: 3)),
              ),
              if (!last) Expanded(child: Container(width: 2, color: _border)),
            ]),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(j.period,
                      style: const TextStyle(color: _muted, fontSize: 13, letterSpacing: 0.5)),
                  const SizedBox(height: 4),
                  Text(j.title,
                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
                  Text(j.company, style: const TextStyle(color: _accent, fontSize: 15)),
                  if (j.summary.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(j.summary, style: const TextStyle(color: _muted, height: 1.6)),
                  ],
                ]),
              ),
            ),
          ]),
        );

    final all = [...profile.experience, ...profile.education];
    return Column(children: [
      for (var i = 0; i < all.length; i++) entry(all[i], last: i == all.length - 1),
    ]);
  }
}

class _Projects extends StatelessWidget {
  const _Projects({required this.wide});
  final bool wide;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final cols = c.maxWidth >= 900 ? 3 : (c.maxWidth >= 560 ? 2 : 1);
      const gap = 16.0;
      final w = (c.maxWidth - gap * (cols - 1)) / cols;
      return Wrap(
        spacing: gap,
        runSpacing: gap,
        children: [
          for (final p in profile.projects)
            SizedBox(
              width: w,
              height: cols == 1 ? null : 250,
              child: _Card(
                onTap: () => _open(p.url),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const Icon(Icons.folder_open_rounded, color: _accent),
                    const Spacer(),
                    const Icon(Icons.north_east_rounded, size: 18, color: _muted),
                  ]),
                  const SizedBox(height: 16),
                  Text(p.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(p.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: _muted, height: 1.5, fontSize: 14)),
                  if (cols > 1) const Spacer() else const SizedBox(height: 16),
                  Wrap(spacing: 6, runSpacing: 6, children: [
                    for (final t in p.tags) _Chip(t, small: true),
                  ]),
                ]),
              ),
            ),
        ],
      );
    });
  }
}

class _Writing extends StatelessWidget {
  const _Writing();
  @override
  Widget build(BuildContext context) {
    return _Card(
      onTap: () => _open(profile.blogUrl),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: _accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.edit_note_rounded, color: _accent, size: 30),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('The blog',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(profile.blogBlurb, style: const TextStyle(color: _muted, height: 1.5)),
          ]),
        ),
        const Icon(Icons.north_east_rounded, color: _muted),
      ]),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Let's build something.",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      const Text(
          'Open to networking, side projects and a good pickup game. '
          'The fastest way to reach me is below.',
          style: TextStyle(color: _muted, fontSize: 17, height: 1.6)),
      const SizedBox(height: 24),
      Wrap(spacing: 12, runSpacing: 12, children: [
        for (final l in profile.links)
          OutlinedButton.icon(
            onPressed: () => _open(l.url),
            icon: Icon(_iconFor(l.kind), size: 18),
            label: Text(l.label),
            style: OutlinedButton.styleFrom(
                foregroundColor: _text,
                side: const BorderSide(color: _border),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16)),
          ),
      ]),
    ]);
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: _border))),
      child: Text(
        '© ${DateTime.now().year} ${profile.name} · Built with Flutter',
        textAlign: TextAlign.center,
        style: const TextStyle(color: _muted, fontSize: 13),
      ),
    );
  }
}
