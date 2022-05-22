package com.learnandtesttoeic.until;


import java.util.ArrayList;
import java.util.List;

public class DuplicateElement<T> {
    public List<T> remove(List<T> list){
        List<T> returnList = new ArrayList<>();
        for (T element : list) {
            if (!returnList.contains(element)) {
                returnList.add(element);
            }
        }
    return returnList;
    }
}
