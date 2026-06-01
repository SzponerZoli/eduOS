 # eduOS
 a Universal Blue based immutable Linux distribution for use in education.

 ## Why eduOS?
 A lot of schools run outdated computers that are incapable of running Windows 11 where i live (Hungary). eduOS gives you automatic updates, performance and useful software to use in education. eduOS aims to give a free, open-source, easy-to manage alternative.

## Features

- 🔒 Immutable base — students can't break the system
- 🔄 Automatic updates via bootc image pulls and Flatpak
- 📦 Profile-based software bundles via Flatpak
- 🛠️ YAML-based customization for IT administrators
- 💻 Two desktop environments — KDE Plasma (modern hardware) and Cinnamon (older hardware)

## How it works
eduOS is built on Universal Blue, an immutable Linux base 
where the system files are read-only. This means students can't accidentally 
break the OS — on reboot, everything is back to normal.

Updates are delivered as container images via bootc, similar to how phones 
receive OTA updates. IT administrators never need to manually update individual 
machines.

Software is delivered via Flatpak, sandboxed and profile-specific. Each machine 
type gets only the software it needs, keeping the system lean on older hardware.

## I want to try it
coming soon

## Profiles

| Profile | Target | Key Software |
|---|---|---|
| **Base** | All machines | Browser, file manager, text editor, PDF reader, media player |
| **Student** | Student PCs in computer labs | Office suite, Graphics Utilities, Programming tools |
| **Teacher** | Teacher PCs in computer labs | Everything in Student + Student PC management software, Whiteboard software |
| **Presentation** | Projector/board PCs | Everything in Student + OpenBoard|

## Variants

- eduOS — KDE Plasma, recommended for hardware from 2015+
- eduOS Lite — Cinnamon, recommended for older/weaker hardware

## Customization

IT administrators can customize installed Flatpaks via a simple YAML file:

```yaml
extra-flatpaks:
  - org.example.App
  - hu.example.MasikApp
```
## Roadmap
coming soon

## Status

🚧 Currently in early development. Not ready for production use.

## Contributing

Contributions welcome! Please [write me an e-mail](mailto:szponerzolidev@proton.me) or [open an issue ](https://github.com/SzponerZoli/eduOS/issues/new) first to discuss changes.

## License

MIT
