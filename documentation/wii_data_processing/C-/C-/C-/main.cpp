#include <stdlib.h> 
#include <sstream> 
#include <iostream>
#include <string>
using namespace std;


string Names[1000];
int Values[1000];
int numVars;


//assumes user does not try to add a variable twice
//rule, variables(integers) get initialized to 0

//its up to the user to not divide by 0

//rule there must be a space between everything except () and {}

//only doing 1 calculation at a time, no 1 + 2 + 3 + 4
//ex i = i + 1;

//sample if statment

//if(3 > 2){int a=3;} or if(3 > 2){a=3;}

std::string IntToString ( int number )//for converting stuff
{
  std::ostringstream oss;
  oss<< number;
  return oss.str();
}


string arithmaticCall(string Line)
{

	if(Line[0]=='i'&&Line[1]=='n'&&Line[2]=='t'&&Line[3]==' ')//int
	{
		Line=Line.substr(4,Line.size()-4);
		//pull off variable name from line
		string name=Line.substr(0,Line.find_first_of(' '));
		
		
		Names[numVars]=name;
		Values[numVars]=0;
		numVars++;

		//create variable and set value to 0
	}

	string variable=Line.substr(0,Line.find_first_of(' '));
	Line=Line.substr(Line.find_first_of('=')+1);
	//peeled off variable to set
	Line=Line.substr(Line.find_first_of(' ')+1);
	string first=Line.substr(0,Line.find_first_of(' '));
	int loop = first.find(';');
	if (loop>0)
	{
		first=Line.substr(0,Line.find_first_of(';'));
		int firstValue;
		bool firstb=false;//if true they are a variable
		if (first[0]>57)//57 is 9 i think
		{
			firstb=true;
		}
		if(firstb)//is variable
		{
			for(int i=0;i<numVars;i++)
			{
				if(Names[i].compare(first)==0)
				{
					firstValue=Values[i];
				}
			}
		}
		else
		{
			firstValue= atoi(first.c_str());
		}

		for(int i=0;i<numVars;i++)
		{
			if(Names[i].compare(variable)==0)
			{
				Values[i]=firstValue;
			}
		}



		return first;
	}
	else
	{

		Line=Line.substr(Line.find_first_of(' ')+1);
		

		string arith=Line.substr(0,Line.find_first_of(' '));
		Line=Line.substr(Line.find_first_of(' ')+1);

		string after=Line.substr(0,Line.find_first_of(';'));

	    
			

		bool firstb=false;//if true they are a variable
		bool secondb=false;

		int firstValue;
		int secondValue;

		if (first[0]>57)//57 is 9 i think
		{
			firstb=true;
		}
		if(after[0]>57)//57 is 9 i think
		{
			secondb=true;
		}

		

		if(firstb)//is variable
		{
			for(int i=0;i<numVars;i++)
			{
				if(Names[i].compare(first)==0)
				{
					firstValue=Values[i];
				}
			}
		}
		else
		{
			firstValue= atoi(first.c_str());
		}

		if(secondb)//is variable
		{
			for(int i=0;i<numVars;i++)
			{
				if(Names[i].compare(after)==0)
				{
					secondValue=Values[i];
				}
			}
		}
		else
		{
			secondValue= atoi(after.c_str());
		}
		

		//set variable

		string returnMe="";
		int val=0;
		if(arith.compare("+")==0)
		{
			
			val=firstValue + secondValue;
			
			returnMe=IntToString(val);
		}
		else if(arith.compare("-")==0)
		{
			
			val=firstValue - secondValue;
			
			returnMe=IntToString(val);
		}

		else if(arith.compare("*")==0)
		{
			
			val=firstValue * secondValue;
			
			returnMe=IntToString(val);
		}

		else if(arith.compare("/")==0)
		{
			
			val=firstValue / secondValue;
			
			returnMe=IntToString(val);
		}


		for(int i=0;i<numVars;i++)
		{
			if(Names[i].compare(variable)==0)
			{
				Values[i]=val;
			}
		}


		return returnMe;
	}
}

bool conditionalSolve(string Solve, string relationall)
{
	bool truefalse=false;
    int before= Solve.find(relationall);
	cout<<relationall<<endl;
    string first=Solve.substr(0,before);
    string after=Solve.substr(before+relationall.size());
    cout <<first<<" "<<relationall<<" "<<after<<endl;
	

	bool firstb=false;//if true they are a variable
	bool secondb=false;

	int firstValue;
	int secondValue;

	if (first[0]>57)//57 is 9 i think
	{
		firstb=true;
	}
	if(after[0]>57)//57 is 9 i think
	{
		secondb=true;
	}

	
	if(firstb)//is variable
	{
		for(int i=0;i<numVars;i++)
		{
			if(Names[i].compare(first)==0)
			{
				firstValue=Values[i];
			}
		}
	}
	else
	{
		firstValue= atoi(first.c_str());
	}

	if(secondb)//is variable
	{
		for(int i=0;i<numVars;i++)
		{
			if(Names[i].compare(after)==0)
			{
				secondValue=Values[i];
			}
		}
	}
	else
	{
		secondValue= atoi(after.c_str());
	}
	//5 if statments, one for each relational test

	if(relationall.compare(" == ")==0)
	{
		if(firstValue == secondValue)
		{
			truefalse=true;
		}
		else
		{
			truefalse=false;
		}
	}
	else if(relationall.compare(" > ")==0)
	{
		if(firstValue > secondValue)
		{
			truefalse=true;
		}
		else
		{
			truefalse=false;
		}
	}
	else if(relationall.compare(" >= ")==0)
	{
		if(firstValue >= secondValue)
		{
			truefalse=true;
		}
		else
		{
			truefalse=false;
		}
	}
	else if(relationall.compare(" <= ")==0)
	{
		if(firstValue <= secondValue)
		{
			truefalse=true;
		}
		else
		{
			truefalse=false;
		}
	}
	else if(relationall.compare(" < ")==0)
	{
		if(firstValue < secondValue)
		{
			truefalse=true;
		}
		else
		{
			truefalse=false;
		}
	}

	return truefalse;

}

string relationalCall(string Line, string relationall)
{
		string conditional="";//store "if" or "while" in this
		string statment="";//pull off what is after ) and put it in here
		string solvetobool="";
		string returnMe="";
		
		bool truefalse=false;

		 solvetobool= Line.substr(Line.find_first_of('(')+1,Line.find_last_of(')')-Line.find_first_of('(')-1);
		 statment=Line.substr(Line.find_first_of('{')+1,Line.find_last_of('}')-Line.find_first_of('{')-1);
		 string tempStatement = statment;

		 if(Line[0]=='i')
		 {
			 conditional="if";
		 }
		 else if(Line[0]=='w')
		 {
			conditional="while";
		 }


		
		truefalse=conditionalSolve(solvetobool,relationall);
		cout<<truefalse<<endl;

		 if(conditional.compare("if")==0)
		 {
			if(truefalse)
			{

				while(tempStatement != "")
				{
					string tempStatment=tempStatement.substr(0, tempStatement.find_first_of(';'));
					returnMe=arithmaticCall(tempStatment);
					string::iterator it = tempStatement.begin();
					tempStatement = tempStatement.replace(it, it + tempStatment.size() + 1, "");
				}
				
			}
		 }
		 else if(conditional.compare("while")==0)
		 {
			while(conditionalSolve(solvetobool,relationall))
			{
				while(tempStatement != "")
				{
					string tempStatment=tempStatement.substr(0, tempStatement.find_first_of(';'));
					returnMe=arithmaticCall(tempStatment);
					string::iterator it = tempStatement.begin();
					tempStatement = tempStatement.replace(it, it + tempStatment.size() + 1, "");
				}
				tempStatement = statment;
			}

		 }

		 return returnMe;//should change later
		
}

string parse(string Line)
{
     
	bool relational=false;
	string relationall="";

	if(Line.find(" == ")<Line.size())
     {
      relational=true;
     relationall=" == ";
     }
	if(Line.find(" < ")<Line.size())
     {
      relational=true;
      relationall=" < ";
     }
      if(Line.find(" > ")<Line.size())
     {
      relational=true;
      relationall=" > ";
     }
      if(Line.find(" <= ")<Line.size())
     {
      relational=true;
      relationall=" <= ";
     }
      if(Line.find(" >= ")<Line.size())
     {
      relational=true;
      relationall=" >= ";
     }
//pull off if and while and parentheses

	  //then take what is inside the parentheses and store that value to solvene

	 string returnme="";
     if(relational)
     {
		returnme=relationalCall(Line,relationall);
     }
 //arithmetic, do everything to right of =, then set it to value 
	 //also copy this code into if while statments
	else
	{
		returnme=arithmaticCall(Line);
	}

	

		
     return returnme;
}

int main()
{
	numVars=0;
   // io stuff here
    string fromFile;
    string output="";
	char bob[256];
	cin.getline(bob,256);
	while(bob[0]!=0)
    {
		for(int i=0;i<256;i++)
		{
			if(bob[i]){
				fromFile.push_back(bob[i]);
			}
			else{i=1000;}
		}
          output=     parse(fromFile);
		  fromFile="";
		  cin.getline(bob,256);
    }
   // cout<<output;
	int i=0;
	while(Names[i].empty()==false)
	{
		cout<<"Name "<<Names[i]<<"  Value : "<<Values[i]<<endl;
		i++;
	}
	 system("pause");
    return 0;
}

