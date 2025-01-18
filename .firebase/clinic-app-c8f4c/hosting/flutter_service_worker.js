'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e18d488087dcfe6f6423371b3ec6b658",
"assets/AssetManifest.bin.json": "32e2bebe493efe0652965759e8a2ff46",
"assets/AssetManifest.json": "33ccdbde3ffe6afd691378f3e79a24d7",
"assets/assets/icons/about_us.png": "28f723f1cce9d56dda052a75198ed748",
"assets/assets/icons/arrow_left.png": "14887f0574a8b0e0a019b2469008c340",
"assets/assets/icons/check_circle.png": "32158e181501b9169ca4e5897108dca4",
"assets/assets/icons/clinic.png": "235fe61417b76244f41f3184ee81a0be",
"assets/assets/icons/clinic_details_back.png": "18bd3ccf70f063fcb91134cf52d237a4",
"assets/assets/icons/clinic_details_share.png": "e5e9b896f8709a355e8a22f6f0dbe766",
"assets/assets/icons/clock.png": "17cb77d3ce4d905ea53cd4f3e77172a4",
"assets/assets/icons/compass.png": "277e571f051648f97a1acae1174da1b6",
"assets/assets/icons/dollar_sign.png": "ee80358fce05699b3bb008e1ef5ab75d",
"assets/assets/icons/donation.png": "fa326bc541537c35ee887a600a1f1809",
"assets/assets/icons/drop_down.png": "cd9b1ad0de11419359b6b86598efeda8",
"assets/assets/icons/globe.png": "7051e7ecc321629ac100f6c35041b594",
"assets/assets/icons/homeTwo.png": "370539f61a7ac8dcd5454dae9f72c6b1",
"assets/assets/icons/location_icon.png": "bf712a962f7e08bb23b245e3d031d59d",
"assets/assets/icons/phone.png": "eb26684937a7a8f2e0e197db35cf06ca",
"assets/assets/icons/phone_or_button.png": "696add395956a02508d8299f3a0fd809",
"assets/assets/icons/plus.png": "a46c97835185de8205d05339fc989cc9",
"assets/assets/icons/right_forward.png": "32ff6e031f5fa46e0c9ceb42216eef3e",
"assets/assets/icons/sponsor.png": "fa3527c81743d9aa75445b26fde4d387",
"assets/assets/images/about_us_tab_images/capsule.png": "81ffa2de1ca106a3a1314f319f187158",
"assets/assets/images/avatar.jpg": "c2ec8ddde44fae32c37f10fde0d6fb34",
"assets/assets/images/clinic_tab-images/clinic_page_image_three.png": "64bf1446afbcb83428a2abb95fccb9fb",
"assets/assets/images/clinic_tab-images/clinic_tab_image_one.png": "c74e4a9a7e4f187543e30f21a6bbe373",
"assets/assets/images/clinic_tab-images/clinic_tab_image_two.png": "3d2ee36dad643563859a061f4b31118f",
"assets/assets/images/home_front_container.png": "c8abe6e34c13a4503e2dcb1277fd504f",
"assets/assets/images/home_tab_images/home_tab_gridview_pic.png": "dabe074f27c409415061edcf0987ae3a",
"assets/assets/images/home_tab_images/home_tab_gridview_three.png": "5b372c8879e4186a52237d333f99e76a",
"assets/assets/images/home_tab_images/home_tab_last.png": "591bd9a4b1636654237664e7b687711c",
"assets/assets/images/home_tab_images/home_tab_sponsor.png": "15ff8982ab57036e59ed380ea488859f",
"assets/assets/images/home_tab_images/hom_tab_gridview_two.png": "9631e70170fe0f0e7ca33ff6990cd52a",
"assets/assets/images/location.png": "dc3b66ead2865d0764912010a28a7e6f",
"assets/assets/images/quote_of_the_day_pic.png": "5cfcd019d5d153f487e602243c36d52f",
"assets/assets/images/splash_tab_logo.png": "03a490cce24316019a08f097a1a3527a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "b6d579c63b1d0427d208fce7b6cf7fcd",
"assets/NOTICES": "ccd29a555a20f00abdb965ea0ec9f11d",
"assets/packages/awesome_snackbar_content/assets/back.svg": "ba1c3aebba280f23f5509bd42dab958d",
"assets/packages/awesome_snackbar_content/assets/bubbles.svg": "1df6817bf509ee4e615fe821bc6dabd9",
"assets/packages/awesome_snackbar_content/assets/types/failure.svg": "cb9e759ee55687836e9c1f20480dd9c8",
"assets/packages/awesome_snackbar_content/assets/types/help.svg": "7fb350b5c30bde7deeb3160f591461ff",
"assets/packages/awesome_snackbar_content/assets/types/success.svg": "6e273a8f41cd45839b2e3a36747189ac",
"assets/packages/awesome_snackbar_content/assets/types/warning.svg": "cfcc5fcb570129febe890f2e117615e0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "81b2bc38d7b6a55fa214f98a5bf07cce",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "041b688769565f24b568bad48205ed10",
"/": "041b688769565f24b568bad48205ed10",
"main.dart.js": "af4136a03dd4f6d008bb8e1806ca743b",
"manifest.json": "2b821c7ac886ab834dd56006cd9e3904",
"version.json": "26ab7ddcff94bbda733ad354f3ab7558"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
