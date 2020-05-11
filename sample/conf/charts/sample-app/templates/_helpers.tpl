
{{- define "env_vars" -}}
{{- range $key, $value := . }}
- name: {{ $key | quote }}
  {{- if kindIs "map" $value }}
  valueFrom: {{ $value | toYaml | nindent 4 }}
  {{- else }}
  value: {{ $value | quote }}
  {{ end }}
{{- end -}}
{{- end -}}
