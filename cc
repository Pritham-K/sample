#include<iostream>
using namespace std;

string encrypt(string text,int s)
{
    string result="";
    for(int i=0;i<text.length();i++)
    {
        if(isupper(text[i]))
        {
            result+=char(int(text[i]+s-65)%26+65);
        }
        else
           result+=char(int(text[i]+s-97)%26+97);
    }

    return result;
}

string decrypt(string text,int s)
{
    string result="";
    for(int i=0;i<text.length();i++)
    {
        if(isupper(text[i]))
        {
            result+=char(int(text[i]-s-65+26)%26+65);
        }
        else
            result+=char(int(text[i]-s-97+26)%26+97);
    }
    return result;
}

int main()
{
    string t,e,d;
    int s;
    cout<<"enter the shift value for the caeser cipher:";
    cin>>s;
    cout<<"enter the text to be encrypted:";
    cin>>t;
    e=encrypt(t,s);
    cout<<"encrypted message:"<<e;
    d=decrypt(e,s);
    cout<<"decrypted message:"<<d<<endl;
    return 0;


}
