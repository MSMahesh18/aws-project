{% set booked_nights = 10 %}
{% set amount_booked = 4000 %}

{% set flag = 1 %}

--SELECT * FROM {{ ref("bronze_bookings") }}
-- WHERE NIGHTS_BOOKED > {{ booked_nights }} AND BOOKING_AMOUNT > {{ amount_booked }}
-- (SELECT COALESCE(MAX({{ incremental_col }}), '1900-01-01') FROM {{ ref("bronze_listings") }} )

-- (SELECT COALESCE(MAX({{ incremental_col }}), '1900-01-01') FROM {{ ref("bronze_hosts") }} )

-- (SELECT COALESCE(MAX({{ incremental_col }}), '1900-01-01') FROM {{ ref("bronze_bookings") }} )

SELECT * FROM {{ ref("bronze_bookings") }}
{% if flag == 1%}
    WHERE NIGHTS_BOOKED > {{ booked_nights }} AND BOOKING_AMOUNT > {{ amount_booked }}
{% else %}
    WHERE NIGHTS_BOOKED < {{ booked_nights }} AND BOOKING_AMOUNT < {{ amount_booked }}
{% endif %}