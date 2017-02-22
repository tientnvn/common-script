import os

def createObj(str1, str2, str3, str4, str5):
	content = """	{
		\"_id\": \"str4\",
		\"Link\": \"str1\",
		\"CategoryId\": -1,
		\"CurrentTime\": \"2016-06-07\",
		\"Duration\": \"2016-06-07\",
		\"BookId\": -1,
		\"ParentId\": \"str5\",
		\"Author\": \"123\",
		\"Description\": \"str3\",
		\"Title\": \"str2\",
		\"CoverImage\": \"\",
		\"Downloaded\": false,
		\"CreatedDate\": \"2016-06-07\",
		\"UpdatedDate\": \"2016-06-07\"
	}"""
	content = content.replace("str1", str1)
	content = content.replace("str2", str2)
	content = content.replace("str3", str3)
	content = content.replace("str4", str5)
	content = content.replace("str5", str4)

	#print content
	return content

def removeTaoLao(str):
	result = str.replace("\n","").replace("\r","")
	return result

numberLineIsABlock = 6
listDic = ["out","out_cate"]

for directory in listDic:
	for filename in os.listdir("./" + directory):

		content = """{
	  		"audios": [
		"""
		if filename.endswith(".txt"):
			# Read file
			txt = open("./" + directory + "/" + filename)
			lines = txt.readlines()
			#print lines
			for i in range(len(lines)) :
				obj = ""
				if i % numberLineIsABlock == 0:
					str1 = removeTaoLao(lines[i])
					if i + 1 < len(lines):
						str2 = removeTaoLao(lines[i+1])
					else:
						str2 = ""
					if i + 2 < len(lines):
						str3 = removeTaoLao(lines[i+2])
					else:
						str3 = ""
					if i + 3 < len(lines):
						str4 = removeTaoLao(lines[i+3])
					else:
						str4 = ""
					if i + 4 < len(lines):
						str5 = removeTaoLao(lines[i+4])
					else:
						str5 = ""
					obj = createObj(str1, str2, str3, str4, str5)
					if i + numberLineIsABlock < len(lines):
						obj = "%s" % obj
						obj =  obj + ",\n"
					else:
						obj = "%s" % obj
						obj = obj + """]
	}"""
					content = content + obj

			# Write file
			filenameJson = filename.replace(".txt", ".json")
			print filenameJson
			if not os.path.exists("./result_" + directory):
				os.makedirs("./result_" + directory)
			fo = open("./result_" + directory + "/" + filenameJson, "wb")
			fo.write( content );

			# Close opend file
			fo.close()
