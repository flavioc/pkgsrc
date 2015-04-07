$NetBSD: patch-src_network.c,v 1.3 2015/04/07 13:20:41 fhajny Exp $

Remove libgcrypt deprecation logic. Patch by joerg.
--- src/network.c.orig	2015-02-26 11:49:16.681659031 +0000
+++ src/network.c
@@ -58,27 +58,7 @@
 #endif
 
 #if HAVE_LIBGCRYPT
-# include <pthread.h>
-# if defined __APPLE__
-/* default xcode compiler throws warnings even when deprecated functionality
- * is not used. -Werror breaks the build because of erroneous warnings.
- * http://stackoverflow.com/questions/10556299/compiler-warnings-with-libgcrypt-v1-5-0/12830209#12830209
- */
-#  pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-# endif
-/* FreeBSD's copy of libgcrypt extends the existing GCRYPT_NO_DEPRECATED
- * to properly hide all deprecated functionality.
- * http://svnweb.freebsd.org/ports/head/security/libgcrypt/files/patch-src__gcrypt.h.in
- */
-# define GCRYPT_NO_DEPRECATED
 # include <gcrypt.h>
-# if defined __APPLE__
-/* Re enable deprecation warnings */
-#  pragma GCC diagnostic warning "-Wdeprecated-declarations"
-# endif
-# if GCRYPT_VERSION_NUMBER < 0x010600
-GCRY_THREAD_OPTION_PTHREAD_IMPL;
-# endif
 #endif
 
 #ifndef IPV6_ADD_MEMBERSHIP
@@ -503,19 +483,9 @@ static void network_init_gcrypt (void) /
   if (gcry_control (GCRYCTL_ANY_INITIALIZATION_P))
     return;
 
- /* http://www.gnupg.org/documentation/manuals/gcrypt/Multi_002dThreading.html
-  * To ensure thread-safety, it's important to set GCRYCTL_SET_THREAD_CBS
-  * *before* initalizing Libgcrypt with gcry_check_version(), which itself must
-  * be called before any other gcry_* function. GCRYCTL_ANY_INITIALIZATION_P
-  * above doesn't count, as it doesn't implicitly initalize Libgcrypt.
-  *
-  * tl;dr: keep all these gry_* statements in this exact order please. */
-# if GCRYPT_VERSION_NUMBER < 0x010600
-  gcry_control (GCRYCTL_SET_THREAD_CBS, &gcry_threads_pthread);
-# endif
   gcry_check_version (NULL);
   gcry_control (GCRYCTL_INIT_SECMEM, 32768);
-  gcry_control (GCRYCTL_INITIALIZATION_FINISHED);
+  gcry_control (GCRYCTL_INITIALIZATION_FINISHED,NULL,0);
 } /* }}} void network_init_gcrypt */
 
 static gcry_cipher_hd_t network_get_aes256_cypher (sockent_t *se, /* {{{ */
