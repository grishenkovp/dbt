{% macro percent(number) %}
    ({{ number }} * 0.05)::integer
{%  endmacro %}