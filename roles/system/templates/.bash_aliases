# List all in a long listing human-readable format
alias ll='ls -lah'

# List sorted by size
alias lt='ll -s -1 -FS'

# Colored grep
alias grep='grep --color=auto'

# Find command in history
alias hg='history|grep'

{% if system_bash_aliases is defined and system_bash_aliases|length > 0 %}

# User-defined aliases
{% for item in system_bash_aliases %}
{% if item.comment is defined %}
# {{ item.comment }}
{% endif %}
alias {{ item.alias }}='{{ item.command }}'
{% endfor %}
{% endif %}
