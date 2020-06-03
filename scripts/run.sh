./bin/yscenetrace model/curly-hair1/curly-hair/scene.pbrt -o out/curly-hair.jpg -t path -s 256 -r 512
./bin/yscenetrace model/curly-hair/scene.json -o out/curly-hair.jpg -t path -s 256 -r 512
# need to export to json file the pbrt one (?) err: error in model/curly-hair1/curly-hair/models/hair.pbrt: unknown type curve
# even though the bathroom image rendered well in pbrt format 
#./bin/yscenetrace model/bathroom/scene.pbrt -o out/bathroom.jpg -t path -s 256 -r 512

