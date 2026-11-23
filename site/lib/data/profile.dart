// ---------------------------------------------------------------------------
// EDIT ME: every piece of text on the site lives in this one file.
//
// Anything wrapped in [brackets] or marked `TODO(raf)` is a placeholder that
// could not be found in public sources (GitHub profile, public repos, the old
// Jekyll blog's About page). Replace or delete it before going live.
// ---------------------------------------------------------------------------

import 'models.dart';

const profile = Profile(
  name: 'Raf',
  // TODO(raf): full name, if you want it shown.
  fullName: 'Raf',
  role: 'Software Engineer',
  location: 'Cyberjaya, Malaysia',
  motto: "Everyone's a genius until they execute.",
  heroIntro:
      'I build payment systems, backend services and mobile apps, and I '
      'tinker with AI on the side. Mad curious about how things work.',
  // TODO(raf): drop a photo at site/web/assets/avatar.jpg and set this to
  // 'assets/avatar.jpg' (or any https URL). Empty shows initials.
  avatarUrl: 'https://avatars.githubusercontent.com/u/6120781?v=4',
  about: [
    'I studied Electronics Engineering at Multimedia University (MMU), '
        'Cyberjaya. During my final years I spent many hours learning to '
        'code: exploring my Fedora box, writing Python on a Raspberry Pi, '
        'building websites and mobile apps, and wiring up any IoT device I '
        'could get my hands on.',
    'Since then I have worked on payment gateways and e-recharge platforms '
        'handling tens of thousands of transactions a day, and on enterprise '
        'Java systems in insurance. On the side I ship Flutter apps, write a '
        'blog, teach people to code, and experiment with computer vision and '
        'LLM tooling.',
    'Off the keyboard you will find me on a basketball court or out camping.',
  ],
  skillGroups: [
    SkillGroup('Backend', [
      'Java',
      'Spring Boot',
      'Python',
      'REST & SOAP APIs',
      'Payment integration',
    ]),
    SkillGroup('Mobile & Web', ['Flutter', 'Dart', 'Streamlit', 'HTML/CSS']),
    SkillGroup('Data', ['MySQL', 'Oracle']),
    SkillGroup('Ops', ['Linux', 'Bash', 'Docker', 'Tomcat', 'Git', 'Azure']),
    SkillGroup('AI', ['PyTorch', 'YOLO object detection', 'LLMs & RAG']),
  ],
  experience: [
    Job(
      company: '[Current company]',
      title: '[Current role]',
      // TODO(raf): your current role. Left blank because it isn't public.
      period: '[20XX] – Present',
      summary: '[What you work on now.]',
    ),
    Job(
      company: 'AIA, Cyberjaya Tech Centre',
      title: 'Senior Java Developer',
      period: 'Oct 2021 – [end]',
      summary: 'Enterprise Java services for insurance platforms.',
    ),
    Job(
      company: 'Kendra Solutions',
      title: 'Software Engineer',
      period: '[start] – 2021 (about 5 years)',
      summary:
          'Payment gateway, payment integration and e-recharge systems '
          'handling tens of thousands of daily transactions. Java, Python, '
          'Bash and MySQL, with SOAP and RESTful APIs.',
    ),
    Job(
      company: 'Accenture',
      title: 'Junior Software Engineer',
      period: '[start] – [end]',
      summary: 'Joined three months before graduating.',
    ),
  ],
  education: [
    Job(
      company: 'Multimedia University (MMU), Cyberjaya',
      title: 'Degree in Electronics Engineering',
      period: '[year]',
      summary: '',
    ),
  ],
  projects: [
    Project(
      name: 'AI Basketball Highlight Editor',
      description:
          'Command-line tool that finds made shots in basketball game footage '
          'with YOLOv4 object detection and cuts them into a highlight reel.',
      tags: ['Python', 'PyTorch', 'YOLOv4', 'TensorRT'],
      url: 'https://github.com/mrafsyam/basketball-video-highlight',
    ),
    Project(
      name: 'streamlit-loader',
      description:
          'A gallery of 20 animated loaders for Streamlit: 10 pure CSS/SVG and '
          '10 Lottie, with accessible, screen-reader friendly loading states.',
      tags: ['Python', 'Streamlit', 'CSS', 'Lottie'],
      url: 'https://github.com/mrafsyam/streamlit-loader',
    ),
    Project(
      name: 'Log4Shell Presentation',
      description:
          'Hands-on demo of the Log4Shell (CVE-2021-44228) remote code '
          'execution chain via JNDI LDAP lookup, built for a talk.',
      tags: ['Java', 'Security', 'Log4j'],
      url: 'https://github.com/mrafsyam/log4shell-presentation',
    ),
    Project(
      name: 'Azure Notification Hub × Flutter',
      description:
          'Proof of concept Flutter app receiving in-app push notifications '
          'from Azure Notification Hub.',
      tags: ['Flutter', 'Azure', 'Android'],
      url: 'https://github.com/mrafsyam/azure-notification-hub-flutter-example',
    ),
    Project(
      name: 'JWT Viewer',
      description: 'A small tool to decode and inspect JSON Web Tokens.',
      tags: ['Web', 'Auth'],
      url: 'https://github.com/mrafsyam/jwt-viewer',
    ),
    Project(
      name: '[Your published Flutter apps]',
      // TODO(raf): you have 3 apps on Google Play and the App Store. Add them
      // here with their store links.
      description:
          '[Three Flutter apps published on Google Play and the App Store.]',
      tags: ['Flutter', 'iOS', 'Android'],
      url: 'https://github.com/mrafsyam',
    ),
  ],
  blogUrl: 'https://mrafsyam.github.io/blog/',
  blogBlurb:
      '160+ posts since 2017 on Linux, Java, Git, databases and getting into '
      'software development.',
  links: [
    Link('GitHub', 'https://github.com/mrafsyam', LinkKind.github),
    Link('X / Twitter', 'https://twitter.com/mrafsyam', LinkKind.twitter),
    Link('Telegram', 'https://t.me/everybodycheeze', LinkKind.telegram),
    Link('Instagram', 'https://www.instagram.com/zeroquitgenes', LinkKind.instagram),
    Link('Blog', 'https://mrafsyam.github.io/blog/', LinkKind.blog),
    // TODO(raf): add LinkedIn and/or email if you want them public, e.g.
    // Link('LinkedIn', 'https://www.linkedin.com/in/[you]', LinkKind.linkedin),
    // Link('Email', 'mailto:[you@example.com]', LinkKind.email),
  ],
);
