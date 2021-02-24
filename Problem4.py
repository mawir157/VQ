import imageio as im
import numpy.fft as fft
import numpy as np

source_image = im.imread('test_image.jpg')

def filter2D(image, ratio, highpass=True):
	list = []
	new_image = np.array(list)
	# iterate over the RGB componenets of the image
	for i in range(0,3):
		# convert to freq. domain
		fftImage = fft.fft2(image[:, :, i])
		
		(wx, wy) = fftImage.shape
		dx = int(ratio * wx)
		dy = int(ratio * wy)

		# if highpass, zero out low frequency regions (the corners)
		if highpass:
			fftImage[0:dx, 0:dy] = 0 # tl
			fftImage[0:dx, (wy-dy):wy] = 0 # tr 
			fftImage[(wx-dx):wx, 0:dy] = 0 # br
			fftImage[(wx-dx):wx, (wy-dy):wy] = 0 # bl
		else: # for low pass zero out everything EXCEPT the corners
			fftImage[dx:(wx-dx), :] = 0
			fftImage[:, dy:(wy-dy)] = 0

		fftImage = np.real( fft.ifft2(fftImage) )

		if len(new_image) == 0:
			new_image = [fftImage]
		else:
			new_image = np.concatenate((new_image, [fftImage]))
		pass

	# rearrange the numpy array to get it back into the correct form...
	new_image = np.transpose(new_image, (1,2,0))
	# ...normalize the values to be within [0, 255]...
	new_image = 255*(new_image - np.min(new_image))/np.ptp(new_image)
	# ...and cast to uint8
	return new_image.astype(np.uint8)

for x in range(1,20):
	f = x / 500
	filename = "filtered_image_{:02d}.jpg".format(x)
	im.imwrite(filename, filter2D(source_image, f))
	pass
