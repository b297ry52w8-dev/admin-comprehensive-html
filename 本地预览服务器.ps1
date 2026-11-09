$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '.')).Path
$port = 4173
$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
$listener.Start()
Write-Host "行政综合原型预览地址: http://127.0.0.1:$port/index.html#/portal/home"

$mime = @{
  '.html' = 'text/html; charset=utf-8'; '.css' = 'text/css; charset=utf-8'; '.js' = 'application/javascript; charset=utf-8'
  '.svg' = 'image/svg+xml'; '.png' = 'image/png'; '.jpg' = 'image/jpeg'; '.jpeg' = 'image/jpeg'; '.gif' = 'image/gif'
  '.otf' = 'font/otf'; '.woff' = 'font/woff'; '.woff2' = 'font/woff2'; '.json' = 'application/json; charset=utf-8'
}
try {
  while ($listener.Server.IsBound) {
    $client = $listener.AcceptTcpClient()
    $stream = $client.GetStream()
    $reader = [System.IO.StreamReader]::new($stream, [Text.Encoding]::ASCII, $false, 4096, $true)
    $requestLine = $reader.ReadLine()
    while (($line = $reader.ReadLine()) -and $line.Length -gt 0) { }
    $target = if ($requestLine) { ($requestLine -split ' ')[1] } else { '/' }
    $pathOnly = ($target -split '\?')[0] -split '#',2 | Select-Object -First 1
    try {
      $relative = [Uri]::UnescapeDataString($pathOnly.TrimStart('/'))
      if ([string]::IsNullOrWhiteSpace($relative)) { $relative = 'index.html' }
      $full = [IO.Path]::GetFullPath((Join-Path $root ($relative -replace '/', '\')))
      if (-not $full.StartsWith($root, [StringComparison]::OrdinalIgnoreCase)) { throw [UnauthorizedAccessException]::new() }
      if (Test-Path -LiteralPath $full -PathType Container) { $full = Join-Path $full 'index.html' }
      if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
        $bytes = [Text.Encoding]::UTF8.GetBytes('Not Found')
        $status = '404 Not Found'
        $contentType = 'text/plain; charset=utf-8'
      } else {
        $bytes = [IO.File]::ReadAllBytes($full)
        $ext = [IO.Path]::GetExtension($full).ToLowerInvariant()
        $contentType = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { 'application/octet-stream' }
        $status = '200 OK'
      }
      $header = "HTTP/1.1 $status`r`nContent-Type: $contentType`r`nContent-Length: $($bytes.Length)`r`nCache-Control: no-cache`r`nConnection: close`r`n`r`n"
      $headerBytes = [Text.Encoding]::ASCII.GetBytes($header)
      $stream.Write($headerBytes, 0, $headerBytes.Length)
      $stream.Write($bytes, 0, $bytes.Length)
    } catch {
      $bytes = [Text.Encoding]::UTF8.GetBytes('Local preview server error')
      $header = "HTTP/1.1 500 Internal Server Error`r`nContent-Type: text/plain; charset=utf-8`r`nContent-Length: $($bytes.Length)`r`nConnection: close`r`n`r`n"
      $headerBytes = [Text.Encoding]::ASCII.GetBytes($header)
      $stream.Write($headerBytes, 0, $headerBytes.Length)
      $stream.Write($bytes, 0, $bytes.Length)
    } finally {
      $reader.Dispose()
      $stream.Dispose()
      $client.Dispose()
    }
  }
} finally {
  $listener.Stop()
}
