
{{/*
Expand the name of the core component.
*/}}
{{- define "database.name" -}}
{{- include "alterconso.name" . }}-database
{{- end }}

{{/*
Expand the name of the core component.
*/}}
{{- define "database.fullname" -}}
{{- include "alterconso.fullname" . }}-database
{{- end }}

{{/*
Selector labels
*/}}
{{- define "database.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alterconso.name" . }}
app.kubernetes.io/component: {{ include "database.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "database.labels" -}}
helm.sh/chart: {{ include "alterconso.chart" . }}
{{ include "database.selectorLabels" . -}}
{{/* substr trims delimeter prefix char from alloy.imageId output
    e.g. ':' for tags and '@' for digests.
    For digests, we crop the string to a 7-char (short) sha. */}}
{{/* 
app.kubernetes.io/version: {{ (include "database.imageId" .) | trunc 15 | trimPrefix "@sha256" | trimPrefix ":" | quote }}
*/}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ .Release.Name }}
{{- end }}

{{/*
Expand the Full qualified Domain Name of database.
*/}}
{{- define "database.serviceFqdn" -}}
{{- include "database.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local
{{- end }}