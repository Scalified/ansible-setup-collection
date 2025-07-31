# List all in a long listing human-readable format
alias ll='ls -lah'

# List sorted by size
alias lt='ll -s -1 -FS'

# Colored grep
alias grep='grep --color=auto'

# Find command in history
alias hg='history|grep'

{% if packages_bash_aliases is defined and packages_bash_aliases|length > 0 %}

# User-defined aliases
{% for alias in packages_bash_aliases %}
{% if alias.comment is defined %}
# {{ alias.comment }}
{% endif %}
alias {{ alias.alias }}='{{ alias.command }}'
{% endfor %}
{% endif %}
