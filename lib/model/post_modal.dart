// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String? id;
  final String? post_id;
  final String? user_id;
  final String? recipient_id;
  final String? postText;
  final String? page_id;
  final String? group_id;
  final String? event_id;
  final String? page_event_id;
  final String? postLink_id;
  final String? postLinkTitle;
  final String? postLinkImage;
  final String? postLinkContent;
  final String? postVimeo;
  final String? postDailyMotion;
  final String? postFacebook;
  final String? postFile;
  final String? postFileName;
  final String? postFileThumb;
  final String? postYoutube;
  final String? postVine;
  final String? postSoundCloud;
  final String? postPlayTube;
  final String? postDeepsound;
  final String? postMap;
  final String? lat_;
  final String? lng_;
  final String? postShare;
  final String? postPrivacy;
  final String? postType;
  final String? postFeeling;
  final String? postListening;
  final String? postTraveling;
  final String? postWatching;
  final String? postPlaying;
  final String? postPhoto;
  final String? time;
  final String? registered;
  final String? album_name;
  final String? multi_image;
  final String? multi_image_post;
  final String? product_id;
  final String? poll_id;
  final String? blog_id;
  final String? forum_id;
  final String? thread_id;
  final String? videoViews;
  final String? postRecord;
  final String? postSticker;
  final bool? shared_from;
  final String? post_url;
  final String? parent_id;
  final String? cache;
  final String? comments_status;
  final String? blur;
  final String? color_id;
  final String? job_id;
  final String? offer_id;
  final String? fund_raise_id;
  final String? fund_id;
  final String? active;
  final String? stream_name;
  final String? agora_token;
  final String? live_time;
  final String? live_ended;
  final String? agora_resource_id;
  final String? agora_sid;
  final String? send_notify;

  final String? processing;
  final String? background_post;
  final String? background;
  final String? fontcolor;
  final String? custom_users;
  final String? reactions;
  final String? engages;
  final String? post_category;
  final String? video_meta_data;
  final String? music_category;
  final String? music_artist;
  final String? music_title;
  final String? show_music_title_on_post;
  final String? show_on_buzzin;
  final Map<String, dynamic>? publisher;
  final int? limit_comments;
  final bool? limited_comments;
  final bool? is_group_post;
  final bool? group_recipient_exists;
  final bool? group_admin;
  final int? post_is_promoted;
  final String? postText_API;
  final String? Orginaltext;
  final String? post_time;
  final int? page;
  final String? url;
  final String? seo_id;
  final String? via_type;
  final bool? recipient_exists;
  final String? recipient;
  final bool? admin;
  final String? post_share;
  final bool? is_post_saved;
  final String? is_post_reported;
  final String? is_post_boosted;
  final String? is_liked;
  final String? is_wondered;
  final String? post_comments;
  final String? post_shares;
  final String? post_likes;
  final String? post_wonders;
  final String? is_post_pinned;
  final String? get_post_comments;
  final String? total_comments;
  final List<String>? all_comments;
  final List<String>? photo_album;
  final List<String>? options;
  final String? voted_id;
  final String? postFile_full;
  final Map<String, dynamic>? reaction;
  final List<String>? job;
  final List<String>? offer;
  final List<String>? fund;
  final List<String>? fund_data;
  final List<String>? forum;
  final List<String>? thread;
  final String? is_still_live;
  final String? live_sub_users;
  final String? likes_string;
  PostModel({
    this.id,
    this.post_id,
    this.user_id,
    this.recipient_id,
    this.postText,
    this.page_id,
    this.group_id,
    this.event_id,
    this.page_event_id,
    this.postLink_id,
    this.postLinkTitle,
    this.postLinkImage,
    this.postLinkContent,
    this.postVimeo,
    this.postDailyMotion,
    this.postFacebook,
    this.postFile,
    this.postFileName,
    this.postFileThumb,
    this.postYoutube,
    this.postVine,
    this.postSoundCloud,
    this.postPlayTube,
    this.postDeepsound,
    this.postMap,
    this.lat_,
    this.lng_,
    this.postShare,
    this.postPrivacy,
    this.postType,
    this.postFeeling,
    this.postListening,
    this.postTraveling,
    this.postWatching,
    this.postPlaying,
    this.postPhoto,
    this.time,
    this.registered,
    this.album_name,
    this.multi_image,
    this.multi_image_post,
    this.product_id,
    this.poll_id,
    this.blog_id,
    this.forum_id,
    this.thread_id,
    this.videoViews,
    this.postRecord,
    this.postSticker,
    this.shared_from,
    this.post_url,
    this.parent_id,
    this.cache,
    this.comments_status,
    this.blur,
    this.color_id,
    this.job_id,
    this.offer_id,
    this.fund_raise_id,
    this.fund_id,
    this.active,
    this.stream_name,
    this.agora_token,
    this.live_time,
    this.live_ended,
    this.agora_resource_id,
    this.agora_sid,
    this.send_notify,
    this.processing,
    this.background_post,
    this.background,
    this.fontcolor,
    this.custom_users,
    this.reactions,
    this.engages,
    this.post_category,
    this.video_meta_data,
    this.music_category,
    this.music_artist,
    this.music_title,
    this.show_music_title_on_post,
    this.show_on_buzzin,
    this.publisher,
    this.limit_comments,
    this.limited_comments,
    this.is_group_post,
    this.group_recipient_exists,
    this.group_admin,
    this.post_is_promoted,
    this.postText_API,
    this.Orginaltext,
    this.post_time,
    this.page,
    this.url,
    this.seo_id,
    this.via_type,
    this.recipient_exists,
    this.recipient,
    this.admin,
    this.post_share,
    this.is_post_saved,
    this.is_post_reported,
    this.is_post_boosted,
    this.is_liked,
    this.is_wondered,
    this.post_comments,
    this.post_shares,
    this.post_likes,
    this.post_wonders,
    this.is_post_pinned,
    this.get_post_comments,
    this.total_comments,
    this.all_comments,
    this.photo_album,
    this.options,
    this.voted_id,
    this.postFile_full,
    this.reaction,
    this.job,
    this.offer,
    this.fund,
    this.fund_data,
    this.forum,
    this.thread,
    this.is_still_live,
    this.live_sub_users,
    this.likes_string,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post_id': post_id,
      'user_id': user_id,
      'recipient_id': recipient_id,
      'postText': postText,
      'page_id': page_id,
      'group_id': group_id,
      'event_id': event_id,
      'page_event_id': page_event_id,
      'postLink_id': postLink_id,
      'postLinkTitle': postLinkTitle,
      'postLinkImage': postLinkImage,
      'postLinkContent': postLinkContent,
      'postVimeo': postVimeo,
      'postDailyMotion': postDailyMotion,
      'postFacebook': postFacebook,
      'postFile': postFile,
      'postFileName': postFileName,
      'postFileThumb': postFileThumb,
      'postYoutube': postYoutube,
      'postVine': postVine,
      'postSoundCloud': postSoundCloud,
      'postPlayTube': postPlayTube,
      'postDeepsound': postDeepsound,
      'postMap': postMap,
      'lat_': lat_,
      'lng_': lng_,
      'postShare': postShare,
      'postPrivacy': postPrivacy,
      'postType': postType,
      'postFeeling': postFeeling,
      'postListening': postListening,
      'postTraveling': postTraveling,
      'postWatching': postWatching,
      'postPlaying': postPlaying,
      'postPhoto': postPhoto,
      'time': time,
      'registered': registered,
      'album_name': album_name,
      'multi_image': multi_image,
      'multi_image_post': multi_image_post,
      'product_id': product_id,
      'poll_id': poll_id,
      'blog_id': blog_id,
      'forum_id': forum_id,
      'thread_id': thread_id,
      'videoViews': videoViews,
      'postRecord': postRecord,
      'postSticker': postSticker,
      'shared_from': shared_from,
      'post_url': post_url,
      'parent_id': parent_id,
      'cache': cache,
      'comments_status': comments_status,
      'blur': blur,
      'color_id': color_id,
      'job_id': job_id,
      'offer_id': offer_id,
      'fund_raise_id': fund_raise_id,
      'fund_id': fund_id,
      'active': active,
      'stream_name': stream_name,
      'agora_token': agora_token,
      'live_time': live_time,
      'live_ended': live_ended,
      'agora_resource_id': agora_resource_id,
      'agora_sid': agora_sid,
      'send_notify': send_notify,
      'processing': processing,
      'background_post': background_post,
      'background': background,
      'fontcolor': fontcolor,
      'custom_users': custom_users,
      'reactions': reactions,
      'engages': engages,
      'post_category': post_category,
      'video_meta_data': video_meta_data,
      'music_category': music_category,
      'music_artist': music_artist,
      'music_title': music_title,
      'show_music_title_on_post': show_music_title_on_post,
      'show_on_buzzin': show_on_buzzin,
      'publisher': publisher,
      'limit_comments': limit_comments,
      'limited_comments': limited_comments,
      'is_group_post': is_group_post,
      'group_recipient_exists': group_recipient_exists,
      'group_admin': group_admin,
      'post_is_promoted': post_is_promoted,
      'postText_API': postText_API,
      'Orginaltext': Orginaltext,
      'post_time': post_time,
      'page': page,
      'url': url,
      'seo_id': seo_id,
      'via_type': via_type,
      'recipient_exists': recipient_exists,
      'recipient': recipient,
      'admin': admin,
      'post_share': post_share,
      'is_post_saved': is_post_saved,
      'is_post_reported': is_post_reported,
      'is_post_boosted': is_post_boosted,
      'is_liked': is_liked,
      'is_wondered': is_wondered,
      'post_comments': post_comments,
      'post_shares': post_shares,
      'post_likes': post_likes,
      'post_wonders': post_wonders,
      'is_post_pinned': is_post_pinned,
      'get_post_comments': get_post_comments,
      'total_comments': total_comments,
      'all_comments': all_comments,
      'photo_album': photo_album,
      'options': options,
      'voted_id': voted_id,
      'postFile_full': postFile_full,
      'reaction': reaction,
      'job': job,
      'offer': offer,
      'fund': fund,
      'fund_data': fund_data,
      'forum': forum,
      'thread': thread,
      'is_still_live': is_still_live,
      'live_sub_users': live_sub_users,
      'likes_string': likes_string,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] != null ? map['id'] as String : null,
      post_id: map['post_id'] != null ? map['post_id'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      recipient_id: map['recipient_id'] != null ? map['recipient_id'] as String : null,
      postText: map['postText'] != null ? map['postText'] as String : null,
      page_id: map['page_id'] != null ? map['page_id'] as String : null,
      group_id: map['group_id'] != null ? map['group_id'] as String : null,
      event_id: map['event_id'] != null ? map['event_id'] as String : null,
      page_event_id: map['page_event_id'] != null ? map['page_event_id'] as String : null,
      postLink_id: map['postLink_id'] != null ? map['postLink_id'] as String : null,
      postLinkTitle: map['postLinkTitle'] != null ? map['postLinkTitle'] as String : null,
      postLinkImage: map['postLinkImage'] != null ? map['postLinkImage'] as String : null,
      postLinkContent: map['postLinkContent'] != null ? map['postLinkContent'] as String : null,
      postVimeo: map['postVimeo'] != null ? map['postVimeo'] as String : null,
      postDailyMotion: map['postDailyMotion'] != null ? map['postDailyMotion'] as String : null,
      postFacebook: map['postFacebook'] != null ? map['postFacebook'] as String : null,
      postFile: map['postFile'] != null ? map['postFile'] as String : null,
      postFileName: map['postFileName'] != null ? map['postFileName'] as String : null,
      postFileThumb: map['postFileThumb'] != null ? map['postFileThumb'] as String : null,
      postYoutube: map['postYoutube'] != null ? map['postYoutube'] as String : null,
      postVine: map['postVine'] != null ? map['postVine'] as String : null,
      postSoundCloud: map['postSoundCloud'] != null ? map['postSoundCloud'] as String : null,
      postPlayTube: map['postPlayTube'] != null ? map['postPlayTube'] as String : null,
      postDeepsound: map['postDeepsound'] != null ? map['postDeepsound'] as String : null,
      postMap: map['postMap'] != null ? map['postMap'] as String : null,
      lat_: map['lat_'] != null ? map['lat_'] as String : null,
      lng_: map['lng_'] != null ? map['lng_'] as String : null,
      postShare: map['postShare'] != null ? map['postShare'] as String : null,
      postPrivacy: map['postPrivacy'] != null ? map['postPrivacy'] as String : null,
      postType: map['postType'] != null ? map['postType'] as String : null,
      postFeeling: map['postFeeling'] != null ? map['postFeeling'] as String : null,
      postListening: map['postListening'] != null ? map['postListening'] as String : null,
      postTraveling: map['postTraveling'] != null ? map['postTraveling'] as String : null,
      postWatching: map['postWatching'] != null ? map['postWatching'] as String : null,
      postPlaying: map['postPlaying'] != null ? map['postPlaying'] as String : null,
      postPhoto: map['postPhoto'] != null ? map['postPhoto'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      registered: map['registered'] != null ? map['registered'] as String : null,
      album_name: map['album_name'] != null ? map['album_name'] as String : null,
      multi_image: map['multi_image'] != null ? map['multi_image'] as String : null,
      multi_image_post: map['multi_image_post'] != null ? map['multi_image_post'] as String : null,
      product_id: map['product_id'] != null ? map['product_id'] as String : null,
      poll_id: map['poll_id'] != null ? map['poll_id'] as String : null,
      blog_id: map['blog_id'] != null ? map['blog_id'] as String : null,
      forum_id: map['forum_id'] != null ? map['forum_id'] as String : null,
      thread_id: map['thread_id'] != null ? map['thread_id'] as String : null,
      videoViews: map['videoViews'] != null ? map['videoViews'] as String : null,
      postRecord: map['postRecord'] != null ? map['postRecord'] as String : null,
      postSticker: map['postSticker'] != null ? map['postSticker'] as String : null,
      shared_from: map['shared_from'] != null ? map['shared_from'] as bool : null,
      post_url: map['post_url'] != null ? map['post_url'] as String : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as String : null,
      cache: map['cache'] != null ? map['cache'] as String : null,
      comments_status: map['comments_status'] != null ? map['comments_status'] as String : null,
      blur: map['blur'] != null ? map['blur'] as String : null,
      color_id: map['color_id'] != null ? map['color_id'] as String : null,
      job_id: map['job_id'] != null ? map['job_id'] as String : null,
      offer_id: map['offer_id'] != null ? map['offer_id'] as String : null,
      fund_raise_id: map['fund_raise_id'] != null ? map['fund_raise_id'] as String : null,
      fund_id: map['fund_id'] != null ? map['fund_id'] as String : null,
      active: map['active'] != null ? map['active'] as String : null,
      stream_name: map['stream_name'] != null ? map['stream_name'] as String : null,
      agora_token: map['agora_token'] != null ? map['agora_token'] as String : null,
      live_time: map['live_time'] != null ? map['live_time'] as String : null,
      live_ended: map['live_ended'] != null ? map['live_ended'] as String : null,
      agora_resource_id: map['agora_resource_id'] != null ? map['agora_resource_id'] as String : null,
      agora_sid: map['agora_sid'] != null ? map['agora_sid'] as String : null,
      send_notify: map['send_notify'] != null ? map['send_notify'] as String : null,
      processing: map['processing'] != null ? map['processing'] as String : null,
      background_post: map['background_post'] != null ? map['background_post'] as String : null,
      background: map['background'] != null ? map['background'] as String : null,
      fontcolor: map['fontcolor'] != null ? map['fontcolor'] as String : null,
      custom_users: map['custom_users'] != null ? map['custom_users'] as String : null,
      reactions: map['reactions'] != null ? map['reactions'] as String : null,
      engages: map['engages'] != null ? map['engages'] as String : null,
      post_category: map['post_category'] != null ? map['post_category'] as String : null,
      video_meta_data: map['video_meta_data'] != null ? map['video_meta_data'] as String : null,
      music_category: map['music_category'] != null ? map['music_category'] as String : null,
      music_artist: map['music_artist'] != null ? map['music_artist'] as String : null,
      music_title: map['music_title'] != null ? map['music_title'] as String : null,
      show_music_title_on_post: map['show_music_title_on_post'] != null ? map['show_music_title_on_post'] as String : null,
      show_on_buzzin: map['show_on_buzzin'] != null ? map['show_on_buzzin'] as String : null,
      publisher: map['publisher'] != null ? Map<String, dynamic>.from((map['publisher'] as Map<String, dynamic>)) : null,
      limit_comments: map['limit_comments'] != null ? map['limit_comments'] as int : null,
      limited_comments: map['limited_comments'] != null ? map['limited_comments'] as bool : null,
      is_group_post: map['is_group_post'] != null ? map['is_group_post'] as bool : null,
      group_recipient_exists: map['group_recipient_exists'] != null ? map['group_recipient_exists'] as bool : null,
      group_admin: map['group_admin'] != null ? map['group_admin'] as bool : null,
      post_is_promoted: map['post_is_promoted'] != null ? map['post_is_promoted'] as int : null,
      postText_API: map['postText_API'] != null ? map['postText_API'] as String : null,
      Orginaltext: map['Orginaltext'] != null ? map['Orginaltext'] as String : null,
      post_time: map['post_time'] != null ? map['post_time'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      seo_id: map['seo_id'] != null ? map['seo_id'] as String : null,
      via_type: map['via_type'] != null ? map['via_type'] as String : null,
      recipient_exists: map['recipient_exists'] != null ? map['recipient_exists'] as bool : null,
      recipient: map['recipient'] != null ? map['recipient'] as String : null,
      admin: map['admin'] != null ? map['admin'] as bool : null,
      post_share: map['post_share'] != null ? map['post_share'] as String : null,
      is_post_saved: map['is_post_saved'] != null ? map['is_post_saved'] as bool : null,
      is_post_reported: map['is_post_reported'] != null ? map['is_post_reported'] as String : null,
      is_post_boosted: map['is_post_boosted'] != null ? map['is_post_boosted'] as String : null,
      is_liked: map['is_liked'] != null ? map['is_liked'] as String : null,
      is_wondered: map['is_wondered'] != null ? map['is_wondered'] as String : null,
      post_comments: map['post_comments'] != null ? map['post_comments'] as String : null,
      post_shares: map['post_shares'] != null ? map['post_shares'] as String : null,
      post_likes: map['post_likes'] != null ? map['post_likes'] as String : null,
      post_wonders: map['post_wonders'] != null ? map['post_wonders'] as String : null,
      is_post_pinned: map['is_post_pinned'] != null ? map['is_post_pinned'] as String : null,
      get_post_comments: map['get_post_comments'] != null ? map['get_post_comments'] as String : null,
      total_comments: map['total_comments'] != null ? map['total_comments'] as String : null,
      all_comments: map['all_comments'] != null ? List<String>.from((map['all_comments'] as List<String>)) : null,
      photo_album: map['photo_album'] != null ? List<String>.from((map['photo_album'] as List<String>)) : null,
      options: map['options'] != null ? List<String>.from((map['options'] as List<String>)) : null,
      voted_id: map['voted_id'] != null ? map['voted_id'] as String : null,
      postFile_full: map['postFile_full'] != null ? map['postFile_full'] as String : null,
      reaction: map['reaction'] != null ? Map<String, dynamic>.from((map['reaction'] as Map<String, dynamic>)) : null,
      job: map['job'] != null ? List<String>.from((map['job'] as List<String>)) : null,
      offer: map['offer'] != null ? List<String>.from((map['offer'] as List<String>)) : null,
      fund: map['fund'] != null ? List<String>.from((map['fund'] as List<String>)) : null,
      fund_data: map['fund_data'] != null ? List<String>.from((map['fund_data'] as List<String>)) : null,
      forum: map['forum'] != null ? List<String>.from((map['forum'] as List<String>)) : null,
      thread: map['thread'] != null ? List<String>.from((map['thread'] as List<String>)) : null,
      is_still_live: map['is_still_live'] != null ? map['is_still_live'] as String : null,
      live_sub_users: map['live_sub_users'] != null ? map['live_sub_users'] as String : null,
      likes_string: map['likes_string'] != null ? map['likes_string'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
