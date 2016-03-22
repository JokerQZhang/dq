package com.joker.dq.dao.hibernate;

import com.joker.dq.model.ShipCar;
import com.joker.dq.dao.ShipCarDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("shipCarDao")
public class ShipCarDaoHibernate extends GenericDaoHibernate<ShipCar, Long> implements ShipCarDao {

    public ShipCarDaoHibernate() {
        super(ShipCar.class);
    }
}
