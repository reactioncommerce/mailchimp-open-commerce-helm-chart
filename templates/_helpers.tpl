{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "reactioncommerce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "reactioncommerce.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "reactioncommerce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "reactioncommerce.admin.url" -}}
{{- $hostName := .Values.admin.host -}}
{{- if .Values.admin.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "reactioncommerce.api.url" -}}
{{- $hostName := .Values.api.host -}}
{{- if .Values.api.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "reactioncommerce.identity.url" -}}
{{- $hostName := .Values.identity.host -}}
{{- if .Values.identity.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}


{{- define "reactioncommerce.web.url" -}}
{{- $hostName := .Values.web.host -}}
{{- if .Values.web.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "reactioncommerce.hydra.frontend.url" -}}
{{- $hostName := .Values.hydra.frontend.host -}}
{{- if .Values.hydra.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "reactioncommerce.hydra.admin.url" -}}
{{- $hostName := .Values.hydra.admin.host -}}
{{- if .Values.hydra.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}