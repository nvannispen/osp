- view: identities
  sql_table_name: jetstream_mongo.identities
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: admin_user_id
    type: string
    # hidden: true
    sql: ${TABLE}.adminUserId

  - dimension: billing_address_slug
    type: string
    sql: ${TABLE}.billingAddressSlug

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.createdAt

  - dimension: current_site
    type: string
    sql: ${TABLE}.currentSite

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deletedAt

  - dimension: discover_enabled
    type: yesno
    sql: ${TABLE}.discoverEnabled

  - dimension: email_canonical
    type: string
    sql: ${TABLE}.emailCanonical

  - dimension: encrypted_id
    type: string
    sql: ${TABLE}.encryptedId

  - dimension: first_name
    type: string
    sql: ${TABLE}.firstName

  - dimension: grp
    type: string
    sql: ${TABLE}.grp

  - dimension: join_site
    type: string
    sql: ${TABLE}.joinSite

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastLogin

  - dimension: last_name
    type: string
    sql: ${TABLE}.lastName

  - dimension: love_id
    type: string
    sql: ${TABLE}.loveId

  - dimension_group: m_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.mCreatedAt

  - dimension: m_level
    type: number
    sql: ${TABLE}.mLevel

  - dimension_group: m_level_exp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.mLevelExpAt

  - dimension: m_points
    type: number
    sql: ${TABLE}.mPoints

  - dimension: m_points_snapshot
    type: number
    sql: ${TABLE}.mPointsSnapshot

  - dimension: member_type
    type: string
    sql: ${TABLE}.memberType

  - dimension_group: member_type_dates_buyer
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.memberTypeDates_buyer

  - dimension_group: member_type_dates_network
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.memberTypeDates_network

  - dimension_group: member_type_dates_repeat
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.memberTypeDates_repeat

  - dimension_group: member_type_dates_repeat_network
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.memberTypeDates_repeatNetwork

  - dimension: num_followers
    type: number
    sql: ${TABLE}.numFollowers

  - dimension: num_follows
    type: number
    sql: ${TABLE}.numFollows

  - dimension: num_friends
    type: number
    sql: ${TABLE}.numFriends

  - dimension: numloves
    type: number
    sql: ${TABLE}.numloves

  - dimension_group: old_survey
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.oldSurveyAt

  - dimension: originator_id
    type: string
    # hidden: true
    sql: ${TABLE}.originatorId

  - dimension: pw
    type: string
    sql: ${TABLE}.pw

  - dimension: shipping_address_slug
    type: string
    sql: ${TABLE}.shippingAddressSlug

  - dimension: social_profiles_facebook
    type: string
    sql: ${TABLE}.social_profiles_facebook

  - dimension_group: social_profiles_facebook_birthday
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.social_profiles_facebook_birthday

  - dimension: social_profiles_facebook_email
    type: string
    sql: ${TABLE}.social_profiles_facebook_email

  - dimension: social_profiles_facebook_friends
    type: number
    sql: ${TABLE}.social_profiles_facebook_friends

  - dimension: social_profiles_facebook_gender
    type: string
    sql: ${TABLE}.social_profiles_facebook_gender

  - dimension: social_profiles_twitter
    type: number
    sql: ${TABLE}.social_profiles_twitter

  - dimension: social_profiles_twitter_followers
    type: number
    sql: ${TABLE}.social_profiles_twitter_followers

  - dimension: subscription_choice
    type: string
    sql: ${TABLE}.subscriptionChoice

  - dimension_group: survey
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.surveyAt

  - dimension: timeline_enabled
    type: yesno
    sql: ${TABLE}.timelineEnabled

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updatedAt

  - dimension: url_key
    type: string
    sql: ${TABLE}.urlKey

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - first_name
    - last_name
    - originators.id
    - admin_users.id
    - admin_users.ldap_username

