class Profile {
  const Profile({
    required this.name,
    required this.fullName,
    required this.role,
    required this.location,
    required this.motto,
    required this.heroIntro,
    required this.avatarUrl,
    required this.about,
    required this.skillGroups,
    required this.experience,
    required this.education,
    required this.projects,
    required this.blogUrl,
    required this.blogBlurb,
    required this.links,
  });

  final String name;
  final String fullName;
  final String role;
  final String location;
  final String motto;
  final String heroIntro;
  final String avatarUrl;
  final List<String> about;
  final List<SkillGroup> skillGroups;
  final List<Job> experience;
  final List<Job> education;
  final List<Project> projects;
  final String blogUrl;
  final String blogBlurb;
  final List<Link> links;
}

class SkillGroup {
  const SkillGroup(this.label, this.skills);
  final String label;
  final List<String> skills;
}

class Job {
  const Job({
    required this.company,
    required this.title,
    required this.period,
    required this.summary,
  });
  final String company;
  final String title;
  final String period;
  final String summary;
}

class Project {
  const Project({
    required this.name,
    required this.description,
    required this.tags,
    required this.url,
  });
  final String name;
  final String description;
  final List<String> tags;
  final String url;
}

enum LinkKind { github, twitter, telegram, instagram, blog, linkedin, email }

class Link {
  const Link(this.label, this.url, this.kind);
  final String label;
  final String url;
  final LinkKind kind;
}
