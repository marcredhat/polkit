
getent group polkitd >/dev/null && echo -e "\e[1;32mpolkitd group already exists\e[0m" || { groupadd -r polkitd && echo -e "\e[1;33mAdded missing polkitd group\e[0m" || echo -e "\e[1;31mAdding polkitd group FAILED\e[0m"; }
getent passwd polkitd >/dev/null && echo -e "\e[1;32mpolkitd user already exists\e[0m" || { useradd -r -g polkitd -d / -s /sbin/nologin -c "User for polkitd" polkitd && echo -e "\e[1;33mAdded missing polkitd user\e[0m" || echo -e "\e[1;31mAdding polkitd user FAILED\e[0m"; }

rpm -Va polkit\* && echo -e "\e[1;32mpolkit* rpm verification passed\e[0m" || { echo -e "\e[1;33mResetting polkit* rpm user/group ownership & perms\e[0m"; rpm --setugids polkit polkit-pkla-compat; rpm --setperms polkit polkit-pkla-compat; }

shutdown -r now
