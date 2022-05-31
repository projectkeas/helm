{{/*
    Create chart name and version as used by the chart label.
*/}}
{{- define "helmchart.versionstring" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
    Common labels
*/}}
{{- define "helmchart.labels" -}}
app.kubernetes.io/component: keas-ingestion
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/part-of: project-keas
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ include "helmchart.versionstring" . }}
{{- end }}

{{/*
    Selector labels
*/}}
{{- define "helmchart.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}

{{/*
    Create a default fully qualified app name.
    If release name contains chart name it will be used as a full name.
*/}}
{{- define "helmchart.fullname" -}}
{{ .Chart.Name}}-{{ .Release.Name }}
{{- end }}


{{/*
    Service account name helper
*/}}
{{- define "helmchart.serviceAccountName" -}}
{{ default .Chart.Name .Values.serviceAccount.name }}
{{- end }}