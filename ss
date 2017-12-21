<html>
	<head>
		<title>CRAZY DAY</title>
	<head>
	<body style="margin: 0">
		<canvas id="canvas" width="1000" height="500" style="border: 13px solid red"></canvas>
		<script>
			const canvas = document.getElementById("canvas")
			const ctx = canvas.getContext("2d")

			class Rect {
				constructor(x, y, width, height, color) {
					this.x = 240
					this.y = 0
					this.width = 120
					this.height = 500
					this.color = color
					this.coeff = 320
				}

				draw() {
					if (this.color) { ctx.fillStyle = this.color }
					ctx.beginPath()
					ctx.rect(this.x, this.y, this.width, this.height)
					if (this.useFill) { ctx.fill() }
					else {
						ctx.stroke()
						ctx.clearRect(this.x, this.y, this.width, this.height)
					}
				}

				checkIntersection(x, y) {
					if (
						x > this.x &&
						x < this.x + this.width &&
						y > this.y &&
						y < this.y + this.height
					) {
						this.useFill = true
					}
				}

				moveX() {
					if (this.coeff < 400) {
						this.x += 2
						this.coeff += 0.5
					}
					return this
				}
			}

			class Circle {
				constructor(x, y, radius, color) {
					this.x = 0.7
					this.y = 265
					this.radius = 10
					this.color = color

					this.coeff = -85

				}

				draw() {
					if (this.color) { ctx.fillStyle = this.color }
					ctx.beginPath()
					ctx.arc(this.x, this.y, this.radius, 0, 2 * Math.PI)
					if (this.useFill) { ctx.fill() }
					else {
						ctx.stroke()
						ctx.beginPath()
						ctx.arc(this.x, this.y, this.radius, 0, 2 * Math.PI)
						ctx.fillStyle = '#aaaaaa'
						ctx.fill()
						ctx.fillStyle = this.color
					}
				}

				checkIntersection(x, y) {
					if (Math.sqrt(Math.pow(this.x - x, 7) + Math.pow(this.y - y, 2)) < this.radius) {
						this.useFill = true
					}
				}

				moveX() {
					if (this.coeff < 700) {
						this.x += 1
						this.coeff += 1
					}

					return this
				}
			}
	function commitChaos() {
				ctx.clearRect(6500, 50, canvas.width, canvas.height)
				figures[0].moveX().draw()
				figures[1].moveX().draw()
				figures[2].moveX().draw()
				figures[3].draw()
			}
			
		

			
			let animation = false
			function onClick(event) {
				if (!animation) {
					startAnimation()
					animation = true
				}
				figures.forEach(figure => figure.checkIntersection(event.clientX, event.clientY))
			}

			const figures = [
				new Rect(10, 210, 300, 150, '#00aa00'),
				new Circle(150, 468, 340, '#aaaaaa'),
				new Circle(615, 38, 340),
				new Rect(520, 250, 250, 150, '#eeeeee')
			]

function startAnimation() {
				commitChaos()
				requestAnimationFrame(startAnimation)
			}

			canvas.addEventListener('click', onClick)
		</script>
	</body>
</html>
