
# Hyperion (WIP) 🚀
Note: These images are still in the prototyping phase — stay tuned for more updates!

# About Hyperion
Hyperion is a ressurected project of mine, which aims to provide an enhanced stock Fedora experience for Gamers and Content Creators. The project was initially inspired (and a soft-fork) of Bazzite, ut was eventually 

# What’s Coming
#### Enhanced Hardware Support: The Official CachyOS Kernel port to Fedora linux & ananicy-cpp is fully supported within hyperion, allowing users to get the same great kernel in CachyOS, but in a more stable and reliable base system.

#### A pure(ish) Fedora Experience: Hyperion keeps things stock — no extra branding or customization. You can easily enable additional icon themes like the popular Papirus theme through system settings.

### Pre-installed Apps for Your Convenience:

Steam: Ready to go out of the box! Just log in, enable Proton, and start gaming. Installed as a native RPM package, to ensure no performance loss. ProtonPlus is also included out of the box to easily install any version of proton.

Heroic Games Launcher: The Heroic Games Launcher is included to allow easy installation of Epic,GOG & Amazon Games titles. Heroic integrates well with Steam, allowing games to be entered using big picture mode 

Container Tools: Includes Distrobox CLI for container creation. You can easily install DistroShelf or BoxBuddy from the software center for a nice inteface to go alongside. 



### Current Image Status
Right now, only the stock image is being built, and as far as I can see, there may be issues with booting the image due to the custom CachyOS kernel. 

# Rebasing
If rebasing from a fedora image to this, I strongly reccomend enabling initramfs re-generation to ensure your system will work with the custom kernel. (This comment will go away once the issue is fully resolved).
`rpm-ostree initramfs --enable -r`
before rebooting — this will rebuild your initramfs and resolve the issue.
