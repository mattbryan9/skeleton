NAME=$1
FILE=$2
BASE=$3

mkdir ui
mkdir ui/${FILE}
mkdir ui/${FILE}/web
mkdir ui/${FILE}/base
mkdir ui/${FILE}/ionic

shopt -s extglob

cp ./client/scripts/ui/components/${FILE}/${FILE}.component.scss ./ui/${FILE}/base
cp ./client/scripts/ui/components/${FILE}/${FILE}.component.scss ./ui/${FILE}/base
cp ./client/scripts/ui/components/${FILE}/${FILE}.!(*ionic*)html ./ui/${FILE}/base
cp ./client/scripts/ui/components/${FILE}/${FILE}.component.ionic.html ./ui/${FILE}/ionic/${FILE}.component.html

cp ./client/scripts/ui/components/${FILE}/${FILE}.component.ts ./ui/${FILE}/base
sed -i '' s/${NAME}/${BASE}/g ./ui/${FILE}/base/${FILE}.component.ts

# copy and substitute template ts
cp ./template.component.ts ./ui/${FILE}/web/${FILE}.component.ts
cp ./template.component.ts ./ui/${FILE}/ionic/${FILE}.component.ts
sed -i '' s/COMPONENTNAME/${NAME}/g ./ui/${FILE}/web/${FILE}.component.ts
sed -i '' s/COMPONENTNAME/${NAME}/g ./ui/${FILE}/ionic/${FILE}.component.ts
sed -i '' s/my-comp.component/"${FILE}.component"/g ./ui/${FILE}/web/${FILE}.component.ts
sed -i '' s/my-comp.component/"${FILE}.component"/g ./ui/${FILE}/ionic/${FILE}.component.ts
sed -i '' s/BASECOMPONENT/${BASE}/g ./ui/${FILE}/web/${FILE}.component.ts
sed -i '' s/BASECOMPONENT/${BASE}/g ./ui/${FILE}/ionic/${FILE}.component.ts
sed -i '' s/KEBAB/${FILE}/g ./ui/${FILE}/web/${FILE}.component.ts
sed -i '' s/KEBAB/${FILE}/g ./ui/${FILE}/ionic/${FILE}.component.ts

cp ./template.scss ./ui/${FILE}/web/${FILE}.component.scss
cp ./template.ionic.scss ./ui/${FILE}/ionic/${FILE}.component.scss
sed -i '' s/FILE/${FILE}/g ./ui/${FILE}/web/${FILE}.component.scss
sed -i '' s/FILE/${FILE}/g ./ui/${FILE}/ionic/${FILE}.component.scss

# sed -i '' s/\.\/${FILE}.component.html/\.\.\/base/${FILE}.component.html/g ./ui/${FILE}/web/${FILE}.component.ts,

if [ ! -f ./ui/${FILE}/ionic/${FILE}.component.html ]; then
	sed -i '' s/"templateUrl: '../base"/"templateUrl: '../${FILE}"/g ./ui/${FILE}/ionic/${FILE}.component.ts
	cp ./client/scripts/ui/components/${FILE}/${FILE}.component.html ./ui/${FILE}/ionic
fi