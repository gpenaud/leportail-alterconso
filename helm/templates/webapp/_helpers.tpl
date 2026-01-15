
{{/*
Expand the name of the core component.
*/}}
{{- define "webapp.name" -}}
{{- include "alterconso.name" . }}-webapp
{{- end }}

{{/*
Expand the name of the core component.
*/}}
{{- define "webapp.fullname" -}}
{{- include "alterconso.fullname" . }}-webapp
{{- end }}

{{/*
Selector labels
*/}}
{{- define "webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alterconso.name" . }}
app.kubernetes.io/component: {{ include "webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "webapp.labels" -}}
helm.sh/chart: {{ include "alterconso.chart" . }}
{{ include "webapp.selectorLabels" . -}}
{{/* substr trims delimeter prefix char from alloy.imageId output
    e.g. ':' for tags and '@' for digests.
    For digests, we crop the string to a 7-char (short) sha. */}}
{{/* 
app.kubernetes.io/version: {{ (include "webapp.imageId" .) | trunc 15 | trimPrefix "@sha256" | trimPrefix ":" | quote }}
*/}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ .Release.Name }}
{{- end }}