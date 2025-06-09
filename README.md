
# tj5-os (WIP) 🚀
Note: These images are still in the prototyping phase — stay tuned for more updates!

# About tj5os
tj5os is a ressurected project of mine, which aims to provide an enhanced stock Fedora experience for Gamers and Content Creators. The project was initially inspired (and a soft-fork) of Bazzite. 

Now, tj5os has a standalone Fedora Kinoite image as well as a Bazzite image, giving you the best of both worlds.

# NOTICE - Other Image(s)
## Due to the way tj5-os is built, a separate version of the KDE edition with flatpak apps such as DistroShelf, ProtonPlus and the Native Brave Browser can be found at https://github.com/tj5miniop/tj5-os


# What’s Coming
#### Enhanced Hardware Support: The Official CachyOS Kernel port to Fedora linux & ananicy-cpp is fully supported within hyperion, allowing users to get the same great kernel in CachyOS, but in a more stable and reliable base system.

#### A pure(ish) Fedora Experience: everything is as stock as possible — no extra branding or customization. You can easily enable additional icon themes like the popular Papirus theme through system settings.

### Pre-installed Apps for Your Convenience:

Steam: Ready to go out of the box! Just log in, enable Proton, and start gaming. Installed as a native RPM package, to ensure no performance loss. ProtonPlus is also included out of the box to easily install any version of proton.

Container Tools: Includes Distrobox CLI for container creation. You can easily install DistroShelf or BoxBuddy from the software center for a nice inteface to go alongside. 




### Current Image Status
Right now, only the stock image is being built, and as far as I can see, there may be issues with booting the image due to the custom CachyOS kernel. 

# Rebasing
If rebasing from a fedora image to this, I strongly reccomend enabling initramfs re-generation to ensure your system will work with the custom kernel. (This comment will go away once the issue is fully resolved).
`rpm-ostree initramfs --enable -r`
before rebooting — this will rebuild your initramfs and resolve the issue.
