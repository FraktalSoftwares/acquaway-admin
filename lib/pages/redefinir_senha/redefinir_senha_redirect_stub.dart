// Stub para plataformas não-web (Android, iOS, etc.)
// Redirecionamento via URL só faz sentido na web; em app nativo não aplicável.

void redirectToUrl(String url) {
  // Em mobile, redirecionamento via location.href não existe.
  // Só é chamado quando kIsWeb é true (web usa o outro arquivo).
  // No-op aqui.
}
