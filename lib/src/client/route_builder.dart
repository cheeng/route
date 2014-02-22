// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of route.client;

typedef RouteHandler(RouteEvent);

/**
 * Returns a new Route
 */
Route route(UriPattern pattern, {
    RouteHandler onEnter,
    RouteHandler onExit,
    Map<String, Route> children,
    String defaultRoute,
    String index
  }) {

  _logger.fine("route($pattern, defaultRoute: $defaultRoute)");

  if (pattern == null) throw new ArgumentError("pattern is null");

  var r = new Route(pattern, index: index, defaultRouteName: defaultRoute);
  if (children != null) r.addRoutes(children);
  if (onExit != null) r.onExit.listen(onExit);
  if (onEnter != null) r.onExit.listen(onEnter);
  return r;
}

UriPattern uri(String s) =>
    new UriParser(new UriTemplate(s));

//class RouteBuilder {
//  String name;
//  UriPattern pattern;
//  String indexRoute;
//  String defaultRoute;
//  Map<String, RouteBuilder> children;
//  RouteHandler beforeLeave;
//  RouteHandler beforeEnter;
//  RouteHandler onLeave;
//  RouteHandler onEnter;
//
//
//  RouteBuilder({
//      this.name,
//      this.pattern,
//      this.indexRoute,
//      this.defaultRoute,
//      this.children,
//      this.beforeLeave,
//      this.beforeEnter,
//      this.onLeave,
//      this.onEnter});
//}
