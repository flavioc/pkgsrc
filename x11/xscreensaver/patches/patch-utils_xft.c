$NetBSD: patch-utils_xft.c,v 1.1 2018/06/25 08:42:39 wiz Exp $

Fix build with libX11-1.6.5.

--- utils/xft.c.orig	2017-11-02 20:05:48.000000000 +0000
+++ utils/xft.c
@@ -198,12 +198,12 @@ XftColorAllocValue (Display *dpy,
       int green_shift, green_len;
       int blue_shift, blue_len;
 
-      red_shift   = maskbase (visual->rgba_masks[0]);
-      red_len     = masklen  (visual->rgba_masks[0]);
-      green_shift = maskbase (visual->rgba_masks[1]);
-      green_len   = masklen (visual->rgba_masks[1]);
-      blue_shift  = maskbase (visual->rgba_masks[2]);
-      blue_len    = masklen (visual->rgba_masks[2]);
+      red_shift   = maskbase (visual->red_mask);
+      red_len     = masklen  (visual->red_mask);
+      green_shift = maskbase (visual->green_mask);
+      green_len   = masklen (visual->green_mask);
+      blue_shift  = maskbase (visual->blue_mask);
+      blue_len    = masklen (visual->blue_mask);
       result->pixel = (((color->red   >> (16 - red_len))   << red_shift)   |
                        ((color->green >> (16 - green_len)) << green_shift) |
                        ((color->blue  >> (16 - blue_len))  << blue_shift));
