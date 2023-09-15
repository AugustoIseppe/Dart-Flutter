<!DOCTYPE html>
<html lang="en">
<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Event",
      "name": "The Adventures of Kira and Morrison",
      "startDate": "2025-07-21T19:00:00-05:00",
      "endDate": "2025-07-21T23:00-05:00",
      "eventStatus": "https://schema.org/EventScheduled",
      "eventAttendanceMode": "https://schema.org/OnlineEventAttendanceMode",
      "location": {
        "@type": "VirtualLocation",
        "url": "https://operaonline.stream5.com/"
        },
      "image": [
        "https://example.com/photos/1x1/photo.jpg",
        "https://example.com/photos/4x3/photo.jpg",
        "https://example.com/photos/16x9/photo.jpg"
       ],
      "description": "The Adventures of Kira and Morrison is coming to Snickertown in a can't miss performance.",
      "offers": {
        "@type": "Offer",
        "url": "https://www.example.com/event_offer/12345_201803180430",
        "price": "30",
        "priceCurrency": "USD",
        "availability": "https://schema.org/InStock",
        "validFrom": "2024-05-21T12:00"
      },
      "performer": {
        "@type": "PerformingGroup",
        "name": "Kira and Morrison"
      },
      "organizer": {
        "@type": "Organization",
        "name": "Kira and Morrison Music",
        "url": "https://kiraandmorrisonmusic.com"
      }
    }
    </script>
<head>
	<style>

		/* Styling the body */
		body {
			margin: 0;
			padding: 0;
		}
		/* Styling section, giving background
			image and dimensions */
		section {
			padding-top:5%;
			padding-bottom:5%;
			width: 100%;
			height: 100vh;
			background:
				url(
'https://img.freepik.com/premium-photo/asian-musician-playing-guitar-black-background-with-spot-light_38052-71.jpg'
				);
			background-size: cover;
		}
		/* Styling the left floating section */
		section .leftBox {
			width: 50%;
			height: 100%;
			float: left;
			padding: 50px;
			box-sizing: border-box;
		}
		/* Styling the background of
			left floating section */
		section .leftBox .content {
			color: #fff;
			background: rgba(0, 0, 0, 0.5);
			padding: 40px;
			transition: .5s;
		}
		/* Styling the hover effect
			of left floating section */
		section .leftBox .content:hover {
			background: #e91e63;
		}
		/* Styling the header of left
			floating section */
		section .leftBox .content h1 {
			margin: 0;
			padding: 0;
			font-size: 50px;
			text-transform: uppercase;
		}
		/* Styling the paragraph of
			left floating section */
		section .leftBox .content p {
			margin: 10px 0 0;
			padding: 0;
		}
		/* Styling the three events section */
		section .events {
			position: relative;
			width: 50%;
			height: 100%;
			background: rgba(0, 0, 0, 0.5);
			float: right;
			box-sizing: border-box;
		}
		/* Styling the links of
		the events section */
		section .events ul {
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
			margin: 0;
			padding: 40px;
			box-sizing: border-box;
		}
		/* Styling the lists of the event section */
		section .events ul li {
			list-style: none;
			background: #fff;
			box-sizing: border-box;
			height: 200px;
			margin: 15px 0;
		}
		/* Styling the time class of events section */
		section .events ul li .time {
			position: relative;
			padding: 20px;
			background: #262626;
			box-sizing: border-box;
			width: 30%;
			height: 100%;
			float: left;
			text-align: center;
			transition: .5s;
		}
		/* Styling the hover effect
			of events section */
		section .events ul li:hover .time {
			background: #e91e63;
		}
		/* Styling the header of time
			class of events section */
		section .events ul li .time h2 {
			position: absolute;
			margin: 0;
			padding: 0;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			color: #fff;
			font-size: 60px;
			line-height: 30px;
		}
		/* Styling the texts of time
		class of events section */
		section .events ul li .time h2 span {
			font-size: 30px;
		}

		/* Styling the details
		class of events section */
		section .events ul li .details {
			padding: 20px;
			background: #fff;
			box-sizing: border-box;
			width: 70%;
			height: 100%;
			float: left;
		}
		/* Styling the header of the
		details class of events section */
		section .events ul li .details h3 {
			position: relative;
			margin: 0;
			padding: 0;
			font-size: 22px;
		}
		/* Styling the lists of details
		class of events section */
		section .events ul li .details p {
			position: relative;
			margin: 10px 0 0;
			padding: 0;
			font-size: 16px;
		}
		/* Styling the links of details
		class of events section */
		section .events ul li .details a {
			display: inline-block;
			text-decoration: none;
			padding: 10px 15px;
			border: 1.5px solid #262626;
			margin-top: 8px;
			font-size: 18px;
			transition: .5s;
		}
		/* Styling the details class's hover effect */
		section .events ul li .details a:hover {
			background: #e91e63;
			color: #fff;
			border-color: #e91e63;
		}
	</style>
</head>
<body>
    
<?php
include 'menu.php';
$apiKey = '5f33e1259f45b09af601d1ba587bf3c1d4dd87e8588e7bc366d68855e26fd943';

$apiUrl = 'https://api.sympla.com.br/public/v3/events';

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('s_token: ' . $apiKey));

$response = curl_exec($ch);
curl_close($ch);

$data = json_decode($response, true);

if (isset($data['data'])) {
    foreach ($data['data'] as $event) {
	

    }
} else {
    // echo 'Nenhum evento encontrado.';
}


?>


	<section>
		
		<div class="leftBox">
			
			<div class="content">
				<h1>
					Eventos e Shows
				</h1>
				<p>
					With the idea of imparting programming
					knowledge, Mr. Sandeep Jain, an IIT
					Roorkee alumnus started a dream,
					GeeksforGeeks. Whether programming
					excites you or you feel stifled,
					wondering how to prepare for
					interview questions or
					how to ace data structures and
					algorithms, GeeksforGeeks is a
					one-stop solution. With every
					tick of time, we are adding arrows
					in our quiver. From articles on
					various computer science subjects
					to programming problems for practice,
					from basic to premium courses, from
					technologies to entrance examinations,
					we have been building ample content
					with superior quality. In a short
					span, we have built a community of
					1 Million+ Geeks around the world, 20,000+
					Contributors and 500+ Campus Ambassadors
					in various colleges across the nation.
					Our success stories include a lot of
					students who benefitted in their
					placements and landed jobs at tech
					giants. Our vision is to build a giganti
					network of geeks and we are only a
					fraction of it yet.
				</p>
			</div>
		</div>
		<?php 
		// if (isset($data['data'])) {
		// 	foreach ($data['data'] as $event) {
		// 	if ($event['event_id'] == true) {
		// 		echo 'existe?';
		// 		echo $event['id'];
		// 	}
				

		// 	}
		// } else {
		// 	echo 'Nenhum evento encontrado.';
		// }
	 ?>
		<div class="events"  >
			<ul>
				<li>
					<div class="time" >
						<h2>
						<?php echo '<h2>' . date('d', strtotime($event['start_date'])) . '<br><span>' . date('F', strtotime($event['start_date'])) . '</span></h2>';
 ?> <br>
						</h2>
					</div>
					<div class="details" style="background-image: url(<?php echo $event['image'] ?>); background-position:center;">
						<h3 >
							<?php echo '<p style="text-transform:uppercase; font-size:30px">'.$event['name'];'</p>' ?>
							
						</h3>
						<p style="min-width:27em;max-width:33em">
							<a href="<?php echo $event['url'] ?>" style="margin-top:8%;">View Details</a>
						</p>
					</div>
					<div style="clear: both;"></div>
				</li>
				
			</ul>
			<?php  ?>
		</div>
	</section>



</body>
</html>
