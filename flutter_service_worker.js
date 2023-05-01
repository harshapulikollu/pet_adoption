'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "94f28f688e99a7cc9da91dbc0c686bd6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/pets/penguin2.jpg": "d50cfb3253747ed3e4aa8e10dfceb368",
"assets/assets/pets/dog3.jpg": "40867fb1445706e8d5ebdd978a7f168a",
"assets/assets/pets/fox1.jpg": "b6f1bc292aef459e23df6ea96b99da2a",
"assets/assets/pets/dog5.jpg": "a74b2c015dcc9b1a2d241b83c4ed8eec",
"assets/assets/pets/panda3.jpg": "23c52e842f5559f88130915e1dcd03c0",
"assets/assets/pets/hen1.jpg": "e932ea0175918683213cdbe5759cdb74",
"assets/assets/pets/penguin1.jpg": "2bd35d8570375e1418dc4a51c11a6e66",
"assets/assets/pets/monkey1.jpg": "99137b55c2fa7ca15d118c9102caeaca",
"assets/assets/pets/fish1.jpg": "82d584ae1c5ddd9ea3371e2a8afe850f",
"assets/assets/pets/cat1.jpg": "e3191d862007dd947b6c2843afc926c9",
"assets/assets/pets/rabbit.jpg": "6a846bf766a035fdb243b306a214f27e",
"assets/assets/pets/monkey2.jpg": "ddb6f86c958311e367eb9a33f5fb9d5e",
"assets/assets/pets/dog4.jpg": "7eee98c985d23de87662a041cf7b98d3",
"assets/assets/pets/panda1.jpg": "3a1c55b76344a5a4f51441c7732d3854",
"assets/assets/pets/rabbit3.jpg": "a30d33921c836038d551f9e5bef0ee2e",
"assets/assets/pets/fish2.jpg": "28412a1e1d7453b32706da418e88241a",
"assets/assets/pets/koala2.jpg": "6a1fcec06375d8e4b046499b03660827",
"assets/assets/pets/panda2.jpg": "aa068b174b717310c12533669b11c3d8",
"assets/assets/pets/cat2.jpg": "506163027cb9b39f58f2610739b5ebec",
"assets/assets/pets/rabbit2.jpg": "0186fd2d05315e8872bd556309fc1b3b",
"assets/assets/pets/croc1.jpg": "be9cbdf68c134f5b5063abf7f06ef859",
"assets/assets/pets/bear1.jpg": "d410eaaa02079a9b045229eaa9647207",
"assets/assets/pets/koala1.jpg": "b90857ee3b56d013a070f0cc79f58a97",
"assets/assets/pets/dog2.jpg": "af537550fca2d2e580a9b9e72041cc8f",
"assets/assets/pets/dog1.jpg": "06fae9ffad6a06290ab911a3c40a4202",
"assets/NOTICES": "fe91fa5b4661975506f0fe0fb9f6fd98",
"assets/AssetManifest.json": "5d36fc79c285464219968a711fad1671",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"main.dart.js": "612c5f2c29de89d7d3402f9bf5119db6",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"manifest.json": "91dcee5e1e949dce35a6905ce63fdf11",
"index.html": "a4290bb229e25bdfa4b091f4cccaf06c",
"/": "a4290bb229e25bdfa4b091f4cccaf06c",
"favicon.ico": "824c499fa71bae6bd8c901dcd9c9004f",
"icons/icon-512.png": "d4b986b2ced5d9f2bae94615e6852b07",
"icons/icon-maskable-512.png": "124d98a62baa57a3e4fb1d8ff56a3b6a",
"icons/apple-touch-icon.png": "bcffcdc7ed67269ff9fa7a56ba48bbb5",
"icons/README.txt": "d3df3991a31f034bfa98afdfa3c622e1",
"icons/icon-192.png": "12c4ac1e08a044a0f0e63de3ff6e210f",
"icons/favicon.ico": "824c499fa71bae6bd8c901dcd9c9004f",
"icons/icon-maskable-192.png": "2af248f7f00a0ff1c6ff43028e3e60c8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
