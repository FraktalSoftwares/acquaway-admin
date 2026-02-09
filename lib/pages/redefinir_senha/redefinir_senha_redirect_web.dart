// Implementação para web: usa dart:html
import 'dart:html' as html;

void redirectToUrl(String url) {
  html.window.location.href = url;
}
