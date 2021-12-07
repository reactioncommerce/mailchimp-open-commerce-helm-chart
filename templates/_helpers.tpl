{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "opencommerce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "opencommerce.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "opencommerce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "opencommerce.admin.url" -}}
{{- $hostName := .Values.admin.host -}}
{{- if .Values.admin.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "opencommerce.api.url" -}}
{{- $hostName := .Values.api.host -}}
{{- if .Values.api.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "opencommerce.api.socketUrl" -}}
{{- $hostName := .Values.api.host -}}
{{- if .Values.api.ssl }}
{{- printf "%s://%s" "wss" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "ws" $hostName -}}
{{- end -}}
{{- end -}}

{{- define "opencommerce.web.url" -}}
{{- $hostName := .Values.web.host -}}
{{- if .Values.web.ssl }}
{{- printf "%s://%s" "https" $hostName -}}
{{- else -}}
{{- printf "%s://%s" "http" $hostName -}}
{{- end -}}
{{- end -}}