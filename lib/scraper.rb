require "pry"
require "open-uri"
require "nokogiri"

class Scraper

  BASE_URL = "https://www.tripadvisor.com/Attractions-g60795-Activities-Philadelphia_Pennsylvania.html"

    def self.parse
      doc = Nokogiri::HTML(open(BASE_URL))
    end

    def self.attractions #gets the surface level of each activity to create the output list.
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| attractions.text}
      #creates an array of attractions
      #used in CLI to list attractions
    end

    def self.urls
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| "https://www.tripadvisor.com"+"#{attractions.attr('href')}"}
      #creates an array of attraction urls to parse
      #used in parse_attraction_pages method to create hash
    end

    def self.url_hasher #scrapes the second level. pulls the information about each activity.
      attractions = {
        :title => [],
        :location => [],
        :about => [],
      }

      Scraper.urls.each do |url|
        doc = Nokogiri::HTML(open(url)) #creates new key value pairs in the hash.
          attractions[:title] << doc.css("#HEADING").text #title
          attractions[:location] << doc.css("div.contactInfo span[class='textAlignWrapper address']").text #location
      end
      attractions #this hash will be passed into a method in the Attraction class
    end

end


# attractions[:about] = doc.css("div.attractions-attraction-detail-about-card-Description__modalText--1oJCY").text #about
# attractions[:hours] = doc.css("span.ui_column is-4 attractions-attraction-detail-about-card-OpenHours__dayRange--3hPdS") + url.css("span.ui_column is-8 attractions-attraction-detail-about-card-OpenHours__timeRange--3p3_Z").text

# window.__WEB_CONTEXT__={pageManifest:{"assets":["/components/dist/@ta/platform.polyfill.084d8cdf5f.js","/components/dist/runtime.c1de7ca74f.js","/components/dist/@ta/platform.runtime.8a19f90dd4.js","/components/dist/vendor-babel.9e0d67bdef.js","/components/dist/vendor-react-libs.3f6f86eba0.js","/components/dist/ta-platform.8b80141d56.js","/components/dist/vendor-apollo-libs.f7a52cd28d.js","/components/dist/vendor-common.0d64f7a85a.js","/components/dist/@ta/platform.runtime.e7e9ab5e5c.css","/components/dist/@ta/trips.trip-link.1937a29215.js","/components/dist/@ta/trips.states.0e736660bf.js","/components/dist/ta-common.03e658bc28.js","/components/dist/@ta/social.login-gate.d532b24aac.js","/components/dist/@ta/trips.tracking.f9ef828fef.js","/components/dist/@ta/overlays.fullscreen-overlay.2ccad35132.js","/components/dist/@ta/overlays.modal.9693592c8d.js","/components/dist/@ta/overlays.managers.25a1ced4e3.js","/components/dist/exif-js.82106eb172.js","/components/dist/@ta/input.drop-zone.244d8b25b4.js","/components/dist/@ta/social.failover.af5134ed0a.js","/components/dist/@ta/common.webview.c344af1f2b.js","/components/dist/@ta/tracking.interactions.4a46b14f1f.js","/components/dist/@ta/overlays.pieces.ba25b29c40.js","/components/dist/@ta/events.keyboard-event-listener.b30e1fd8ec.js","/components/dist/@ta/trips.trip-types.5f0792e3fd.js","/components/dist/@ta/trips.trip-util.fb9c796817.js","/components/dist/@ta/common.client.c50a5092ca.js","/components/dist/react-transition-group.ff793a3ef9.js","/components/dist/@ta/overlays.popover.13e9b427cb.js","/components/dist/@ta/common.localstorage.ee3f09bae7.js","/components/dist/@ta/social.feed.b92238929b.js","/components/dist/@ta/trips.graphql.fdef390284.js","/components/dist/@ta/events.event-boundary.07a280c826.js","/components/dist/@ta/events.window.be9982854c.js","/components/dist/@ta/overlays.attached-arrow-overlay.e1732d5f59.js","/components/dist/@ta/overlays.attached-overlay.f2e5ead7d6.js","/components/dist/@ta/overlays.shift.2d4bf4f881.js","/components/dist/@ta/events.window-resize.f5cb404aeb.js","/components/dist/@ta/trips.states.8b21c7b406.css","/components/dist/ta-common.c14237598d.css","/components/dist/@ta/social.login-gate.0a4ee33178.css","/components/dist/@ta/overlays.fullscreen-overlay.f7198570e4.css","/components/dist/@ta/overlays.modal.2b005f7183.css","/components/dist/@ta/input.drop-zone.a2a1035b2d.css","/components/dist/@ta/social.failover.85c4b5ee9b.css","/components/dist/@ta/common.webview.dd67304f49.css","/components/dist/@ta/overlays.pieces.31a4c4068a.css","/components/dist/@ta/overlays.popover.f4aa0a8407.css","/components/dist/@ta/social.onboarding-controller.fd9b2e31f8.js","/components/dist/@ta/social.educational-tooltips.0895bf7d22.js","/components/dist/@ta/social.onboarding-state.2cf6c3bb19.js","/components/dist/@ta/social.onboarding-utils.928d6e67b1.js","/components/dist/@ta/social.suggested-followees.943b728c34.js","/components/dist/@ta/common.sessionstorage.0ec04ef8f8.js","/components/dist/@ta/social.feed-filter.cbfdfcc61e.js","/components/dist/@ta/social.tabs.17f2d517f5.js","/components/dist/@ta/social.scroll.110d84f222.js","/components/dist/@ta/common.infinite-loader.1f152baeb0.js","/components/dist/@ta/overlays.headers.a360b72092.js","/components/dist/@ta/social.cards.5b0269615b.js","/components/dist/@ta/social.facebook-button.84f2690729.js","/components/dist/@ta/social.member-common.8214142f47.js","/components/dist/@ta/social.member.4a4ffe86fe.js","/components/dist/@ta/social.follow.ab60284318.js","/components/dist/@ta/social.sections.11ffb3f70f.js","/components/dist/@ta/social.skeletons.3dbc88f825.js","/components/dist/@ta/search.tracking.d3c7c6c909.js","/components/dist/@ta/social.follow-feed.dadce284ce.js","/components/dist/@ta/social.links.2bbf7c3e18.js","/components/dist/@ta/common.text.b147eee069.js","/components/dist/@ta/overlays.toast.76b791bb32.js","/components/dist/@ta/social.blocks.a3b773fd3a.js","/components/dist/@ta/trips.trip-flow-selector.44f1bf3d35.js","/components/dist/@ta/trips.bookmark-icon.13d712327b.js","/components/dist/@ta/social.place-type.145f909613.js","/components/dist/@ta/public.share-cta.dc8ed4714c.js","/components/dist/@ta/social.member-event.f4cf7a8414.js","/components/dist/@ta/social.actions.e94673e870.js","/components/dist/@ta/social.repost-action.cf15de6a7d.js","/components/dist/react-flip-move.d1248986cb.js","/components/dist/@ta/social.poi.2df08049c9.js","/components/dist/@ta/common.photo-carousel.1f6b88c439.js","/components/dist/@ta/social.dates.e8d695147f.js","/components/dist/@ta/social.section-overflow.ad36994fa2.js","/components/dist/@ta/public.listing.8d17f3001c.js","/components/dist/@ta/public.content-uploader.7032ae7528.js","/components/dist/@ta/social.ugc-actions.4bea137906.js","/components/dist/@ta/media.upload.1c1fe0e1b4.js","/components/dist/@ta/social.block-button.ed10e433e9.js","/components/dist/@ta/social.profile.d7e1a8ab93.js","/components/dist/@ta/social.cover-photo.1d88134830.js","/components/dist/@ta/social.review-info.ada50e19af.js","/components/dist/@ta/social.link-preview.bbaf71a2b1.js","/components/dist/@ta/trips.social.e331e39969.js","/components/dist/@ta/trips.trip-byline.e57a34f707.js","/components/dist/@ta/trips.trip-avatars.dd43116704.js","/components/dist/@ta/trips.collaboration.f310830f12.js","/components/dist/@ta/trips.trip-modal-links.a6f86ce6d1.js","/components/dist/@ta/social.in-destination.4c351ec0db.js","/components/dist/@ta/styleguide.skeleton.535f2c6237.js","/components/dist/@ta/social.obfuscation.08b26d5fd6.js","/components/dist/@ta/trips.saver.74d5433168.js","/components/dist/@ta/trips.trip-constants.f327d3f6d3.js","/components/dist/@ta/trips.trip-toasts.77546fa09c.js","/components/dist/@ta/trips.create-trip-modal.3350851e62.js","/components/dist/@ta/trips.save-to-trip-modal.3e5717ca8e.js","/components/dist/@ta/common.clipboard.a794c241b7.js","/components/dist/@ta/social.common-popover.a075c65e3b.js","/components/dist/@ta/common.loadable.4557e5d8c8.js","/components/dist/@ta/common.indicator-dots.8905b5117b.js","/components/dist/@ta/social.overflow-ui.89449e9dc6.js","/components/dist/@ta/public.iap-reporting.0813a7c79d.js","/components/dist/@ta/events.lifecycle.2850b22d56.js","/components/dist/@ta/common.typeahead.e9f0346cc6.js","/components/dist/@ta/input.text-area.1c358efc7e.js","/components/dist/@ta/social.social-reference.de57b86b11.js","/components/dist/@ta/media.batch-upload.2d720ca427.js","/components/dist/@ta/overlays.custom-overlay.43eff34a61.js","/components/dist/@ta/social.button-group.b69825e6ea.js","/components/dist/@ta/social.message.e88fc373d6.js","/components/dist/@ta/common.geolocation.4a9c0626d8.js","/components/dist/@ta/overlays.slide-in.a71cf6e6cb.js","/components/dist/@ta/trips.trip-errors.b160c9278f.js","/components/dist/@ta/input.text-input.23d7f900cf.js","/components/dist/@ta/trips.privacy-control.c38aa4ef51.js","/components/dist/@ta/trips.privacy-icon.7f9419bf43.js","/components/dist/@ta/social.show-more.dc06a3045e.js","/components/dist/@ta/list.navigable-list.e1b2ceff65.js","/components/dist/@ta/styleguide.radio-button.b8ff050e1a.js","/components/dist/@ta/common.keyboardCodes.e0661c6474.js","/components/dist/@ta/media.cropper.d01e413404.js","/components/dist/@ta/input.slider.431acdb62b.js","/components/dist/@ta/social.onboarding-controller.ae63c3fd10.css","/components/dist/@ta/social.educational-tooltips.13d872e34c.css","/components/dist/@ta/social.suggested-followees.b59ecb3397.css","/components/dist/@ta/social.tabs.286aba5748.css","/components/dist/@ta/social.scroll.0c59c51673.css","/components/dist/@ta/overlays.headers.fa61a38e76.css","/components/dist/@ta/social.cards.bcf2cc8de8.css","/components/dist/@ta/social.facebook-button.24a0482baf.css","/components/dist/@ta/social.member-common.8b6949b9e8.css","/components/dist/@ta/social.member.5ba890f1af.css","/components/dist/@ta/social.follow.4e8367a5ea.css","/components/dist/@ta/social.sections.37a838db6c.css","/components/dist/@ta/social.skeletons.33bf914e55.css","/components/dist/@ta/social.follow-feed.2bb7dd75b9.css","/components/dist/@ta/social.links.0a8b3de2c2.css","/components/dist/@ta/common.text.fa919dc5d5.css","/components/dist/@ta/overlays.toast.4b38096c40.css","/components/dist/@ta/social.blocks.6e65a79598.css","/components/dist/@ta/trips.trip-flow-selector.6c6c5464e7.css","/components/dist/@ta/trips.bookmark-icon.6719c8c88c.css","/components/dist/@ta/social.place-type.3671e6fa41.css","/components/dist/@ta/public.share-cta.84b26b0c47.css","/components/dist/@ta/social.member-event.994482fbbd.css","/components/dist/@ta/social.actions.6fb6c9c538.css","/components/dist/@ta/social.repost-action.01ea6e738c.css","/components/dist/@ta/social.poi.56d7e55ffc.css","/components/dist/@ta/common.photo-carousel.e53a80dfe8.css","/components/dist/@ta/social.section-overflow.e2c3fdd60e.css","/components/dist/@ta/public.listing.93dc76613d.css","/components/dist/@ta/public.content-uploader.24b642342d.css","/components/dist/@ta/social.ugc-actions.c1ba732ae7.css","/components/dist/@ta/media.upload.02148101fd.css","/components/dist/@ta/social.block-button.9fddc72156.css","/components/dist/@ta/social.profile.b9293fecde.css","/components/dist/@ta/social.cover-photo.5639f4e0fa.css","/components/dist/@ta/social.review-info.d7fc19b645.css","/components/dist/@ta/social.link-preview.64c9fa1b3a.css","/components/dist/@ta/trips.trip-byline.b8153f81ce.css","/components/dist/@ta/trips.trip-avatars.80eca78806.css","/components/dist/@ta/trips.collaboration.ea4996823e.css","/components/dist/@ta/social.in-destination.5cbbe4ab77.css","/components/dist/@ta/styleguide.skeleton.74ed96b9e1.css","/components/dist/@ta/trips.trip-toasts.df9c0ae85c.css","/components/dist/@ta/trips.create-trip-modal.3b12d0d226.css","/components/dist/@ta/trips.save-to-trip-modal.8330520211.css","/components/dist/@ta/social.common-popover.3c1bdd2ba7.css","/components/dist/@ta/common.indicator-dots.aee0dbdcca.css","/components/dist/@ta/social.over…

# /data/1.0/attraction/about/102763
# JSON.parse
