
# tj5-os (WIP) 🚀
Note: These images are still in the prototyping phase — stay tuned for more updates!

# About tj5os
tj5os is a ressurected project of mine, which aims to provide an enhanced stock Fedora experience for Gamers and Content Creators. The project was initially inspired (and a soft-fork) of Bazzite. 

Now, tj5os has standalone Fedora Kinoite/Silverblue images as well as a Bazzite image (based on the deck variant, which gives you the DeckUI), giving you the best of both worlds.

# What’s Coming
#### Enhanced Hardware Support:

- Images Are Based on either stock Fedora Silverblue/Kinoite or the Bazzite equivalents.
- Latest Mesa,Vulkan and Linux Firmware is included

# On all images....

Steam: Ready to go out of the box! Just log in, enable Proton, and start gaming. Installed as a native RPM package, to ensure no performance loss. ProtonPlus is also included out of the box to easily install any version of proton.

# Rebasing
If rebasing from a fedora image to this, I strongly reccomend enabling initramfs re-generation to ensure your system will work with the custom kernel. (This comment will go away once the issue is fully resolved).
`rpm-ostree initramfs --enable -r`
before rebooting — this will rebuild your initramfs and resolve the issue.
