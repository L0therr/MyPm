#!/bin/bash
# Web app with expo
# doc = https://docs.expo.io/

echo -e "\e[93mEnter project name: "
read projName

if [[ -z "$projName" ]]
then
echo -e "\e[31mERROR: ENTER A PROJECT NAME"
exit 0
fi

echo -e "\e[32mSTART CREATING A REACT NATIVE APP named : \e[4m$projName \e[24m\e[0m"

mkdir $projName
cd $projName

#is Backend
echo -e "\e[33m=== Install the Native app with Express Backend ? [y/n]\e[0m"
read n

#install backend
if [[ $n = "y" ]]
then
backend=true

bash expressBackendGenerator.sh

echo -e "\e[33m=== Installing Modules\e[0m"
npm i
fi

echo -e "\e[33m=== Installing 'expo-cli' globally\e[0m"
npm install --global expo-cli

echo -e "\e[33m=== Creating project folder\e[0m"
expo init $projName
cd $projName


#=== packages

#NAVIGATION
echo -e "\e[33m=== Install 'React Navigation' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
nav=true
npm i --save react-native-gesture-handler  react-native-reanimated  react-native-screens  react-native-web  react-navigation  react-navigation-stack  react-navigation-tabs   @react-native-community/masked-view  react-native-safe-area-context
npm i --save react-native-vector-icons
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[0m ==="
fi

#REDUX
echo -e "\e[33m=== Install 'Redux' ? [y/n]\e[0m"
read n

if [[ $n = "y" ]]
then
redux=true
npm install --save redux react-redux
echo
echo -e "\e[33m=== Package installation \e[36mComplete\e[33m ===\e[0m"
fi



# END ====================

echo -e "\e[33m=== React Native app has been created \e[36mTO USE YOUR PACKAGES :\e[0m"
echo "#"
echo "#"

#NAVIGATION
if [[ $nav = true ]]
then
echo -e "\e[33m=== For 'React Navigation' :\e[0m"
echo
echo -e "\e[33m=== Import components \e[36mimport {createAppContainer } from 'react-navigation';\e[0m"
echo -e "\e[33m=== Import bottom nav \e[36mimport {createBottomTabNavigator} from 'react-navigation-tabs';\e[0m"
echo -e "\e[33m=== Import stack nav \e[36mimport {createStackNavigator} from 'react-navigation-stack';\e[0m"
echo -e "\e[33m=== Import icons \e[36mimport { Ionicons } from '@expo/vector-icons';;\e[0m"
echo
echo -e "\e[33m=== To create a bottom navigator :\e[0m"
echo
echo "var BottomNavigator = createBottomTabNavigator("
echo "  {"
echo "    Home: HomeScreen,"
echo "    PageA: PageAScreen,"
echo "  },"
echo "  {"
echo "    defaultNavigationOptions: ({ navigation }) => ({"
echo "      tabBarIcon: ({ tintColor }) => {"
echo "        var iconName;"
echo "        if (navigation.state.routeName == 'Home') {"
echo "          iconName = 'ios-information-circle';"
echo "        } else if (navigation.state.routeName == 'PageA') {"
echo "          iconName = 'ios-options';"
echo "        }"
echo ""
echo "       return <Ionicons name={iconName} size={25} color={tintColor} />;"
echo "      },"
echo "    }),"
echo "    tabBarOptions: {"
echo "      activeTintColor: '#0984e3',"
echo "      inactiveTintColor: '#dfe6e9',"
echo "    },"
echo "  }"
echo ");"
echo
echo -e "\e[33m=== To create a stack navigator :\e[0m"
echo
echo "var StackNavigator = createStackNavigator({"
echo "  Home: {"
echo "    screen: HomeScreen,"
echo "    navigationOptions: () => ({"
echo "      headerShown: false"
echo "    })"
echo "  },"
echo "  PageA: {"
echo "    screen: PageAScreen,"
echo "    navigationOptions: () => ({"
echo "      title: 'Page A'"
echo "    })"
echo "  }"
echo "}"
echo ");"
echo
echo -e "\e[33m=== DONT FORGET TO EXPORT IT :\e[0m"
echo
echo "export default Navigation = createAppContainer(StackNavigator);"
echo
echo -e "\e[33m=== To navigate through stacks :\e[0m"
echo
echo "onPress={() => navigation.navigate('PageA')}"
echo
echo -e "\e[33m==\e[0m"
fi