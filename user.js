//
/* You may copy+paste this file and use it as it is.
 *
 * If you make changes to your about:config while the program is running, the
 * changes will be overwritten by the user.js when the application restarts.
 *
 * To make lasting changes to preferences, you will have to edit the user.js.
 */

/****************************************************************************
 * Betterfox                                                                *
 * "Ad meliora"                                                             *
 * version: 140                                                             *
 * url: https://github.com/yokoffing/Betterfox                              *
****************************************************************************/

/****************************************************************************
 * SECTION: FASTFOX                                                         *
****************************************************************************/
/** GENERAL ***/
user_pref("content.notify.interval", 100000);

/** GFX ***/
user_pref("gfx.canvas.accelerated.cache-size", 512);
user_pref("gfx.content.skia-font-cache-size", 20);

/** DISK CACHE ***/
user_pref("browser.cache.disk.enable", false);

/** MEMORY CACHE ***/
user_pref("browser.sessionhistory.max_total_viewers", 4);

/** MEDIA CACHE ***/
user_pref("media.memory_cache_max_size", 65536);
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);

/** IMAGE CACHE ***/
user_pref("image.mem.decode_bytes_at_a_time", 32768);

/** NETWORK ***/
user_pref("network.http.max-connections", 1800);
user_pref("network.http.max-persistent-connections-per-server", 10);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheExpiration", 3600);
user_pref("network.ssl_tokens_cache_capacity", 10240);

/** SPECULATIVE LOADING ***/
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.places.speculativeConnect.enabled", false);
user_pref("network.prefetch-next", false);
user_pref("network.predictor.enabled", false);

/** EXPERIMENTAL ***/
user_pref("layout.css.grid-template-masonry-value.enabled", true);

/****************************************************************************
 * SECTION: SECUREFOX                                                       *
****************************************************************************/
/** TRACKING PROTECTION ***/
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.helperApps.deleteTempFileOnExit", true);
user_pref("browser.uitour.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);

/** OCSP & CERTS / HPKP ***/
user_pref("security.OCSP.enabled", 0);
user_pref("security.pki.crlite_mode", 2);

/** SSL / TLS ***/
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.tls.enable_0rtt_data", false);

/** DISK AVOIDANCE ***/
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.sessionstore.interval", 60000);

/** SHUTDOWN & SANITIZING ***/
user_pref("browser.privatebrowsing.resetPBM.enabled", true);
user_pref("privacy.history.custom", true);

/** SEARCH / URL BAR ***/
user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.formfill.enable", false);
user_pref("network.IDN_show_punycode", true);

/** PASSWORDS ***/
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.privateBrowsingCapture.enabled", false);
user_pref("network.auth.subresource-http-auth-allow", 1);
user_pref("editor.truncate_user_pastes", false);

/** MIXED CONTENT + CROSS-SITE ***/
user_pref("security.mixed_content.block_display_content", true);
user_pref("pdfjs.enableScripting", false);

/** EXTENSIONS ***/
user_pref("extensions.enabledScopes", 5);

/** HEADERS / REFERERS ***/
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

/** CONTAINERS ***/
user_pref("privacy.userContext.ui.enabled", true);

/** SAFE BROWSING ***/
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

/** MOZILLA ***/
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
user_pref("browser.search.update", false);
user_pref("permissions.manager.defaultsUrl", "");
user_pref("extensions.getAddons.cache.enabled", false);

/** TELEMETRY ***/
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("datareporting.usage.uploadEnabled", false);

/** EXPERIMENTS ***/
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/** CRASH REPORTS ***/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);

/****************************************************************************
 * SECTION: PESKYFOX                                                        *
****************************************************************************/
/** MOZILLA UI ***/
user_pref("browser.privatebrowsing.vpnpromourl", "");
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.preferences.moreFromMozilla", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.aboutwelcome.enabled", false);
user_pref("browser.profiles.enabled", true);

/** THEME ADJUSTMENTS ***/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.compactmode.show", true);
user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

/** FULLSCREEN NOTICE ***/
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.timeout", 0);

/** URL BAR ***/
user_pref("browser.urlbar.unitConversion.enabled", true);
user_pref("browser.urlbar.trending.featureGate", false);

/** NEW TAB PAGE ***/
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);

/** POCKET ***/
user_pref("extensions.pocket.enabled", false);

/** DOWNLOADS ***/
user_pref("browser.download.manager.addToRecentDocs", false);

/** PDF ***/
user_pref("browser.download.open_pdf_attachments_inline", true);

/** TAB BEHAVIOR ***/
user_pref("browser.bookmarks.openInTabClosesMenu", false);
user_pref("browser.menu.showViewImageInfo", true);
user_pref("findbar.highlightAll", true);
user_pref("layout.word_select.eat_space_to_next_word", false);

/****************************************************************************
 * START: MY OVERRIDES                                                      *
****************************************************************************/
// visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
// visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
// Enter your personal overrides below this line:

user_pref("media.hardwaremediakeys.enabled", false);
user_pref("browser.download.alwaysOpenPanel", false);
user_pref("browser.download.manager.scanWhenDone", false);
user_pref("browser.startup.preXulSkeletonUI", false);
user_pref("narrate.filter-voices", false);
user_pref("webgl.disabled", true);
user_pref("gfx.webrender.compositor", false);
user_pref("browser.newtabpage.activity-stream.filterAdult", true);
user_pref("browser.tabs.loadBookmarksInTabs", true);
user_pref("layout.css.prefers-color-scheme.content-override", 1);
user_pref("network.captive-portal-service.enabled", false);
user_pref("browser.selfsupport.url", "");
user_pref("extensions.pocket.onSaveRecs", false);
user_pref("gtk-enable-animations", false);
user_pref("ui.prefersReducedMotion", 1);
user_pref("accessibility.force_disabled", 1);
user_pref("media.peerconnection.enabled", false);
user_pref("datareporting.policy.firstRunURL", "");
user_pref("security.family_safety.mode", false);
user_pref("dom.webnotifications.serviceworker.enabled", false);
user_pref("browser.translations.enable", false);
user_pref("browser.proton.contextmenus.enabled", 0);
user_pref("browser.proton.doorhangers.enabled", 0);
user_pref("browser.proton.enabled", 0);
user_pref("browser.proton.modals.enabled", 0);
user_pref("media.autoplay.blocking_policy", 2);
user_pref("browser.translations.automaticallyPopup", false);
user_pref("dom.ipc.processPriorityManager.backgroundUsesEcoQoS", false);
user_pref("full-screen-api.transition-duration.leave", 50);
user_pref("full-screen-api.transition-duration.enter", 50);
user_pref("browser.tabs.tabmanager.enabled", false);
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.vpn_promo.enabled", 0);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
user_pref("browser.cache.jsbc_compression_level", 3);
user_pref("browser.tabs.hoverPreview.showThumbnails", false);
user_pref("dom.allow_scripts_to_close_windows", true);
user_pref("sidebar.revamp", false);
user_pref("browser.contentblocking.category", "standard");
user_pref("toolkit.telemetry.unifiedIsOptIn", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("experiments.activeExperiment", false);
user_pref("experiments.enabled", false);
user_pref("experiments.supported", false);
user_pref("network.allow-experiments", false);
user_pref("toolkit.telemetry.rejected", false);
user_pref("datareporting.sessions.current.clean", false);
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", "");
user_pref("toolkit.telemetry.prompted", 2);
//user_pref("network.trr.mode", 0);
//user_pref("network.trr.custom_uri", "");
//user_pref("network.trr.uri", "");
user_pref("layers.acceleration.disabled", true);
user_pref("media.hardware-video-decoding.enabled", false);
user_pref("permissions.default.geo", 0);
user_pref("browser.download.autohideButton", false);
user_pref("accessibility.browsewithcaret_shortcut.enabled", false);
user_pref("media.gpu-process-decoder", false);
user_pref("network.dns.disableIPv6", false);
user_pref("network.http.http3.enable", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("services.sync.prefs.sync.browser.safebrowsing.downloads.enabled", false);
user_pref("browser.ml.enable", false);
user_pref("browser.newtabpage.activity-stream.newtabLayouts.variant-a", false);
user_pref("browser.newtabpage.activity-stream.newtabLayouts.variant-b", false);
user_pref("browser.newtabpage.activity-stream.newtabShortcuts.refresh", false);

user_pref("browser.newtabpage.activity-stream.asrouter.providers.snippets", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.config", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.contextualContent.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.contextualContent.fakespot.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.endpoints", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.merino-provider.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.merino-provider.endpoint", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.personalization.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.personalization.modelKeys", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.placements.spocs", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.placements.tiles", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.sections.cards.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.sections.cards.thumbsUpDown.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.sections.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.sections.personalization.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.spocs.personalized", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.spocs.startupCache.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.spocTopsitesPlacement.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.topicLabels.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories.options", "");
user_pref("browser.newtabpage.activity-stream.feeds.snippets", "");
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.weatherfeed", false);
user_pref("browser.newtabpage.activity-stream.newtabAdSize.billboard", false);
user_pref("browser.newtabpage.activity-stream.newtabAdSize.leaderboard", false);
user_pref("browser.newtabpage.activity-stream.newtabWallpapers.customColor.enabled", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.unifiedAds.adsFeed.enabled", false);
user_pref("browser.newtabpage.activity-stream.unifiedAds.adsFeed.tiles.enabled", false);
user_pref("browser.newtabpage.activity-stream.unifiedAds.endpoint", "");
user_pref("browser.newtabpage.activity-stream.unifiedAds.spocs.enabled", false);
user_pref("browser.newtabpage.activity-stream.unifiedAds.tiles.enabled", false);
user_pref("browser.newtabpage.activity-stream.weather.locationSearchEnabled", false);

user_pref("toolkit.telemetry.dap_enabled", false);
user_pref("toolkit.telemetry.dap_helper", "");
user_pref("toolkit.telemetry.dap.helper.hpke", "");
user_pref("toolkit.telemetry.dap_helper_owner", "");
user_pref("toolkit.telemetry.dap.helper.url", "");
user_pref("toolkit.telemetry.dap_leader", "");
user_pref("toolkit.telemetry.dap.leader.hpke", "");
user_pref("toolkit.telemetry.dap_leader_owner", "");
user_pref("toolkit.telemetry.dap.leader.url", "");
user_pref("toolkit.telemetry.dap_task1_enabled", false);
user_pref("toolkit.telemetry.dap_visit_counting_enabled", false);
user_pref("toolkit.telemetry.dap_visit_counting_experiment_list", "[]");
user_pref("toolkit.telemetry.shutdownPingSender.backgroundtask.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false);
user_pref("toolkit.telemetry.user_characteristics_ping.opt-out", true);

user_pref("extensions.webcompat.smartblockEmbeds.enabled", false);

user_pref("browser.contentanalysis.default_allow", false);
user_pref("browser.contentanalysis.default_result", 0);
user_pref("browser.contentanalysis.enabled", false);
user_pref("browser.contentanalysis.interception_point.clipboard.enabled", false);
user_pref("browser.contentanalysis.interception_point.drag_and_drop.enabled", false);
user_pref("browser.contentanalysis.interception_point.file_upload.enabled", false);
user_pref("browser.contentanalysis.interception_point.print.enabled", false);
user_pref("browser.search.serpEventTelemetryCategorization.enabled", false);
user_pref("browser.search.serpEventTelemetry.enabled", false);
user_pref("browser.search.serpMetricsRecordedCounter", 0);
user_pref("dom.private-attribution.submission.enabled", false);

user_pref("network.trr.ohttp.config_uri", "");
user_pref("network.trr.ohttp.relay_uri", "");
user_pref("network.trr.ohttp.uri", "");
user_pref("network.trr.use_ohttp", false);
user_pref("toolkit.shopping.ohttpConfigURL", "");
user_pref("toolkit.shopping.ohttpRelayURL", "");

user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("datareporting.healthreport.service.enabled", false);

user_pref("browser.ml.chat.prompt.prefix", "");
user_pref("browser.ml.chat.prompts.0", "");
user_pref("browser.ml.chat.prompts.1", "");
user_pref("browser.ml.chat.prompts.2", "");
user_pref("browser.ml.chat.prompts.3", "");
user_pref("browser.ml.chat.prompts.4", "");
user_pref("browser.ml.chat.provider", "");
user_pref("browser.ml.chat.shortcuts.custom", false);
user_pref("browser.ml.chat.shortcuts", false);
user_pref("browser.ml.chat.sidebar", false);
user_pref("browser.ml.modelHubRootUrl", "");

user_pref("browser.urlbar.fakespot.featureGate", false);
user_pref("browser.urlbar.merino.endpointURL", "");
user_pref("browser.urlbar.pocket.featureGate", false);
user_pref("browser.urlbar.weather.featureGate", false);
user_pref("browser.urlbar.yelp.featureGate", false);
user_pref("browser.urlbar.yelp.mlEnabled", false);

user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.mdn.featureGate", false);

user_pref("browser.urlbar.clipboard.featureGate", false);
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);
user_pref("browser.urlbar.recentsearches.featureGate", false);
user_pref("browser.urlbar.showSearchTerms.enabled", false);

user_pref("browser.urlbar.openViewOnFocus", false);
user_pref("browser.urlbar.scotchBonnet.enableOverride", false);

user_pref("browser.urlbar.quicksuggest.contextualOptIn", false);
user_pref("browser.urlbar.quicksuggest.dataCollection.enabled", false);
user_pref("browser.urlbar.quicksuggest.mlEnabled", false);
user_pref("browser.urlbar.quicksuggest.sponsoredIndex", -1);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.fakespot", false);
user_pref("browser.urlbar.suggest.pocket", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.weather", false);
user_pref("browser.urlbar.suggest.yelp", false);
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);

user_pref("dom.iframe_lazy_loading.enabled", false);
user_pref("dom.image-lazy-loading.enabled", false);

user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
user_pref("browser.startup.homepage_override.mstone", "ignore");
user_pref("browser.uitour.url", "");

user_pref("browser.tabs.groups.smart.optin", false);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.tabs.groups.smart.userEnabled", false);
user_pref("browser.newtabpage.activity-stream.images.smart", false);

clearPref("app.installation.timestamp");
clearPref("app.normandy.user_id");
clearPref("browser.contextual-services.contextId");
clearPref("browser.newtabpage.activity-stream.impressionId");
clearPref("browser.search.totalSearches");
clearPref("dom.push.userAgentID");
clearPref("nimbus.profileId");
clearPref("toolkit.telemetry.cachedClientID");
clearPref("toolkit.telemetry.cachedProfileGroupID");

/****************************************************************************
 * SECTION: SMOOTHFOX                                                       *
****************************************************************************/
// visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
// Enter your scrolling overrides below this line:

/****************************************************************************
 * END: BETTERFOX                                                           *
****************************************************************************/
