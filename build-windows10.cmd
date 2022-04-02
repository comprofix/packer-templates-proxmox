mkisofs -J -l -R -V "Auto" -iso-level 4 -o Autounattend.iso floppy/
scp Autounattend.iso root@pve1.comprofix.xyz:/var/lib/vz/template/iso
packer build -var-file .\variables.json .\Windows-10.json
